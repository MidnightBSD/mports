--- apsw/shell.py
+++ apsw/shell.py
@@ -139,7 +139,7 @@
         # successfully parsed and acted upon
         self.interactive = None
         # current colouring object
-        self.command_colour()  # set to default
+        self.command_colour(["off"] if "NO_COLOR" in os.environ else [])
         self._using_readline = False
         self._input_stack = []
         self.input_line_number = 0
@@ -296,4 +296,4 @@
-            if args[0] in ("no-colour", "no-color", "nocolour", "nocolor") or "NO_COLOR" in os.environ:
+            if args[0] in ("no-colour", "no-color", "nocolour", "nocolor"):
                 self.colour_scheme = "off"
                 self._out_colour()
                 args = args[1:]
