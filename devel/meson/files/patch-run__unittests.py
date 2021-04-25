https://github.com/mesonbuild/meson/pull/4324

--- run_unittests.py.orig	2021-02-20 13:17:16 UTC
+++ run_unittests.py
@@ -7604,7 +7604,7 @@ class LinuxlikeTests(BasePlatformTests):
         # Test that installed libraries works
         self.new_builddir()
         self.prefix = oldprefix
-        meson_args = ['-Dc_link_args=-L{}'.format(libdir),
+        meson_args = ['-Dc_link_args=-L{} -Wl,-rpath,{}'.format(libdir, libdir),
                       '--fatal-meson-warnings']
         testdir = os.path.join(self.unit_test_dir, '68 static link')
         env = {'PKG_CONFIG_LIBDIR': os.path.join(libdir, 'pkgconfig')}
