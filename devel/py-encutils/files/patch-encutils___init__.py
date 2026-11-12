--- encutils/__init__.py.orig
+++ encutils/__init__.py
@@ -224,6 +224,22 @@
     """Check if given text is XML (**naive test!**)
     used if no content-type given
     """
+    # Decode only a BOM-selected view to recognize UTF-16/32 XML prologs.
+    # Keep the original octets for detectXMLEncoding's independent BOM check.
+    for bom, codec in (
+        ("\x00\x00\xfe\xff", "utf-32"),
+        ("\xff\xfe\x00\x00", "utf-32"),
+        ("\xfe\xff", "utf-16"),
+        ("\xff\xfe", "utf-16"),
+    ):
+        if text.startswith(bom):
+            try:
+                text = text.encode("latin-1").decode(codec)
+            except UnicodeError:
+                # Preserve the existing literal-text probe for malformed views.
+                if log:
+                    log.debug("Invalid BOM byte view; checking literal XML prolog")
+            break
     if text[:30].find('<?xml version=') != -1:
         return _XML_APPLICATION_TYPE
     else:
@@ -298,6 +314,8 @@
             <meta http-equiv="Content-Type"
                   content="media_type;charset=encoding" />
     """
+    if isinstance(text, bytes):
+        text = text.decode("latin-1")
     p = _MetaHTMLParser()
 
     try:
@@ -344,6 +362,8 @@
         - if BOM and xml declaration fail, utf-8 is returned according
           to XML 1.0.
     """
+    if isinstance(fp, bytes):
+        fp = fp.decode("latin-1")
     if isinstance(fp, str):
         fp = io.StringIO(fp)
 
@@ -474,7 +494,7 @@
     return encoding
 
 
-def getEncodingInfo(response=None, text='', log=None, url=None):  # noqa: C901
+def getEncodingInfo(response=None, text=None, log=None, url=None):  # noqa: C901
     """Find all encoding related information in given `text`.
 
     Information in headers of supplied HTTPResponse, possible XML
@@ -559,7 +579,7 @@
         # may cause IOError which is raised
         response = urllib.request.urlopen(url)
 
-    if text is None:
+    if text is None and response is not None:
         # read text from response only if not explicitly given
         try:
             text = response.read()
@@ -569,6 +589,12 @@
     if text is None:
         # text must be a string (not None)
         text = ''
+
+    # Preserve raw bytes for chardet; sniff ASCII declarations and BOMs using
+    # a one-to-one text view rather than decoding an as-yet unknown encoding.
+    rawtext = text
+    if isinstance(text, bytes):
+        text = text.decode("latin-1")
 
     encinfo = EncodingInfo()
 
@@ -621,7 +647,7 @@
         if not encinfo.encoding:
             encinfo.encoding = encodingByMediaType(encinfo.http_media_type)
         if not encinfo.encoding:
-            encinfo.encoding = tryEncodings(text)
+            encinfo.encoding = tryEncodings(rawtext)
 
     #   text/... + xml or text/*
     elif texttype == _XML_TEXT_TYPE or texttype == _TEXT_TYPE:
