--- Lib/glyphsets/__init__.py.orig	2026-06-29 09:58:29 UTC
+++ Lib/glyphsets/__init__.py
@@ -21,7 +21,7 @@ assert type(GLYPHDATA) is glyphsLib.glyphdata.GlyphDat
 
 assert type(GLYPHDATA) is glyphsLib.glyphdata.GlyphData
 
-root_folder = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "data"))
+root_folder = os.path.join(os.path.dirname(__file__), "data")
 tool_folder = os.path.abspath(os.path.dirname(__file__))
 
 
