https://github.com/mesonbuild/meson/pull/4324

--- run_unittests.py.orig	2021-01-09 10:14:21 UTC
+++ run_unittests.py
@@ -7270,7 +7270,7 @@ class LinuxlikeTests(BasePlatformTests):
         # Test that installed libraries works
         self.new_builddir()
         self.prefix = oldprefix
-        meson_args = ['-Dc_link_args=-L{}'.format(libdir),
+        meson_args = ['-Dc_link_args=-L{} -Wl,-rpath,{}'.format(libdir, libdir),
                       '--fatal-meson-warnings']
         testdir = os.path.join(self.unit_test_dir, '68 static link')
         env = {'PKG_CONFIG_LIBDIR': os.path.join(libdir, 'pkgconfig')}
