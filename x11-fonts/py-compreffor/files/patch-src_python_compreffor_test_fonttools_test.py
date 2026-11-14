--- /dev/null
+++ src/python/compreffor/test/fonttools_test.py
@@ -0,0 +1,77 @@
+from io import BytesIO
+from fontTools.fontBuilder import FontBuilder
+from fontTools.pens.t2CharStringPen import T2CharStringPen
+from fontTools.pens.recordingPen import RecordingPen
+from fontTools.ttLib import TTFont
+import compreffor
+
+
+def test_compression_preserves_real_cff_outlines():
+    names = [".notdef"] + ["g" + str(i) for i in range(32)]
+    b = FontBuilder(1000, isTTF=False)
+    b.setupGlyphOrder(names)
+    b.setupCharacterMap({65 + i: n for i, n in enumerate(names[1:])})
+    chars = {}
+    for i, n in enumerate(names):
+        p = T2CharStringPen(600, None)
+        p.moveTo((50 + i, 0))
+        for k in range(8):
+            p.curveTo(
+                (60 + i + k * 20, 100), (70 + i + k * 20, 150), (80 + i + k * 20, 50)
+            )
+        p.lineTo((50 + i, 0))
+        p.closePath()
+        chars[n] = p.getCharString()
+    b.setupCFF(
+        "ComprefforProbe",
+        {
+            "FullName": "Compreffor Probe",
+            "FamilyName": "ComprefforProbe",
+            "Weight": "Regular",
+        },
+        chars,
+        {},
+    )
+    b.setupHorizontalMetrics({n: (600, 0) for n in names})
+    b.setupHorizontalHeader(ascent=800, descent=-200)
+    b.setupNameTable({"familyName": "ComprefforProbe", "styleName": "Regular"})
+    b.setupOS2(
+        sTypoAscender=800, sTypoDescender=-200, usWinAscent=800, usWinDescent=200
+    )
+    b.setupPost()
+    s = BytesIO()
+    b.font.save(s)
+    raw = s.getvalue()
+
+    def outlines(font):
+        gs = font.getGlyphSet()
+        res = {}
+        for n in names:
+            pen = RecordingPen()
+            gs[n].draw(pen)
+            res[n] = pen.value
+        return res
+
+    expected = outlines(TTFont(BytesIO(raw)))
+    records = []
+    for pure in [False, True]:
+        f = TTFont(BytesIO(raw))
+        compreffor.compress(f, method_python=pure, **({"processes": 1} if pure else {}))
+        dest = BytesIO()
+        f.save(dest)
+        data = dest.getvalue()
+        check = TTFont(BytesIO(data))
+        assert outlines(check) == expected
+        cff = check["CFF "].cff
+        top = cff.topDictIndex[0]
+        ns = len(cff.GlobalSubrs) + len(getattr(top.Private, "Subrs", []))
+        assert ns > 0
+        records.append(
+            {
+                "backend": "python" if pure else "native",
+                "glyphs_preserved": len(names),
+                "subroutines": ns,
+                "input_bytes": len(raw),
+                "output_bytes": len(data),
+            }
+        )
