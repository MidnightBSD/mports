--- test/dialect/test_sqlite.py.orig	2024-09-05 15:50:09 UTC
+++ test/dialect/test_sqlite.py
@@ -3562,12 +3562,12 @@ class ComputedReflectionTest(fixtures.TestBase):
             );""",
             """CREATE TABLE test3 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ","))
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ','))
             );""",
             """CREATE TABLE test4 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")),
-                y INTEGER GENERATED ALWAYS AS (INSTR(x, ",")));""",
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')),
+                y INTEGER GENERATED ALWAYS AS (INSTR(x, ',')));""",
             """CREATE TABLE test5 (
                 s VARCHAR,
                 x VARCHAR GENERATED ALWAYS AS (s || 'x') STORED
@@ -3579,12 +3579,12 @@ class ComputedReflectionTest(fixtures.TestBase):
             );""",
             """CREATE TABLE test7 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")) STORED
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')) STORED
             );""",
             """CREATE TABLE test8 (
                 s VARCHAR,
-                x INTEGER GENERATED ALWAYS AS (INSTR(s, ",")) STORED,
-                y INTEGER GENERATED ALWAYS AS (INSTR(x, ",")) STORED
+                x INTEGER GENERATED ALWAYS AS (INSTR(s, ',')) STORED,
+                y INTEGER GENERATED ALWAYS AS (INSTR(x, ',')) STORED
             );""",
         ]
 
@@ -3604,20 +3604,20 @@ class ComputedReflectionTest(fixtures.TestBase):
             "x": {"text": "s || 'x'", "stored": False},
             "y": {"text": "s || 'y'", "stored": False},
         },
-        "test3": {"x": {"text": 'INSTR(s, ",")', "stored": False}},
+        "test3": {"x": {"text": "INSTR(s, ',')", "stored": False}},
         "test4": {
-            "x": {"text": 'INSTR(s, ",")', "stored": False},
-            "y": {"text": 'INSTR(x, ",")', "stored": False},
+            "x": {"text": "INSTR(s, ',')", "stored": False},
+            "y": {"text": "INSTR(x, ',')", "stored": False},
         },
         "test5": {"x": {"text": "s || 'x'", "stored": True}},
         "test6": {
             "x": {"text": "s || 'x'", "stored": True},
             "y": {"text": "s || 'y'", "stored": True},
         },
-        "test7": {"x": {"text": 'INSTR(s, ",")', "stored": True}},
+        "test7": {"x": {"text": "INSTR(s, ',')", "stored": True}},
         "test8": {
-            "x": {"text": 'INSTR(s, ",")', "stored": True},
-            "y": {"text": 'INSTR(x, ",")', "stored": True},
+            "x": {"text": "INSTR(s, ',')", "stored": True},
+            "y": {"text": "INSTR(x, ',')", "stored": True},
         },
     }
 
