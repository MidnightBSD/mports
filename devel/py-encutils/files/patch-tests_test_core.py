--- tests/test_core.py.orig
+++ tests/test_core.py
@@ -462,3 +462,60 @@
 
             res = (res.encoding, res.mismatch)
             assert exp == res
+
+
+class ByteResponse:
+    def __init__(self, body, content_type="text/html"):
+        from email.message import Message
+        self.headers = Message()
+        self.headers["Content-Type"] = content_type
+        self.body = body
+        self.reads = 0
+
+    def info(self):
+        return self.headers
+
+    def read(self):
+        self.reads += 1
+        return self.body
+
+
+def test_byte_html_metadata():
+    body = b'<meta http-equiv="Content-Type" content="text/html;charset=utf-8">'
+    assert encutils.getMetaInfo(body) == ("text/html", "utf-8")
+    assert encutils.getMetaInfo(body.decode("ascii")) == ("text/html", "utf-8")
+
+
+def test_byte_xml_boms():
+    for body, expected in [
+        (b'\xef\xbb\xbf<?xml version="1.0"?><root/>', "utf-8"),
+        ('<?xml version="1.0"?><root/>'.encode("utf-16"), "utf_16_le"),
+    ]:
+        assert encutils.detectXMLEncoding(body) == expected
+        assert encutils.getEncodingInfo(text=body).encoding == expected
+
+
+def test_http_bytes_preserve_header_priority_and_mismatch():
+    body = b'<html><meta http-equiv="Content-Type" content="text/html;charset=utf-8"></html>'
+    response = ByteResponse(body, "text/html; charset=iso-8859-1")
+    result = encutils.getEncodingInfo(response, body)
+    assert result.encoding == "iso-8859-1"
+    assert result.meta_encoding == "utf-8"
+    assert result.mismatch is True
+    assert response.reads == 0
+
+
+def test_response_body_is_read_when_omitted():
+    body = b'<html><meta http-equiv="Content-Type" content="text/html;charset=utf-8"></html>'
+    response = ByteResponse(body)
+    result = encutils.getEncodingInfo(response)
+    assert result.encoding == "utf-8"
+    assert result.meta_encoding == "utf-8"
+    assert response.reads == 1
+
+
+def test_explicit_empty_text_is_not_replaced_by_response_body():
+    response = ByteResponse(b'<meta http-equiv="Content-Type" content="text/html;charset=utf-8">')
+    result = encutils.getEncodingInfo(response, text="")
+    assert result.encoding == "iso-8859-1"
+    assert response.reads == 0
