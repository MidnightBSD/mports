--- tests/test_plat_other.py.orig
+++ tests/test_plat_other.py
@@ -138,6 +138,7 @@
 def test_trash_topdir(gen_ext_vol):
     trash_dir = op.join(gen_ext_vol[0].trash_topdir, ".Trash")
     os.mkdir(trash_dir, 0o777 | stat.S_ISVTX)
+    os.chmod(trash_dir, 0o777 | stat.S_ISVTX)
 
     s2t(gen_ext_vol[2])
     assert op.exists(gen_ext_vol[2]) is False
