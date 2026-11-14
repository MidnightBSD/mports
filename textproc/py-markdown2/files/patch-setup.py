--- setup.py.orig
+++ setup.py
@@ -51,7 +51,6 @@ setup(
     platforms=["any"],
     py_modules=["markdown2"],
     package_dir={"": "lib"},
-    data_files=[("testing", ["tox.ini"])],
     entry_points={
         "console_scripts": [
             "markdown2 = markdown2:main"
