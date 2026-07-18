--- third_party/waf/waflib/Tools/python.py.orig
+++ third_party/waf/waflib/Tools/python.py
@@ -53,7 +53,12 @@
 	return code and should be installed, if requested
 """
 
-DISTUTILS_IMP = ['from distutils.sysconfig import get_config_var, get_python_lib']
+DISTUTILS_IMP = [
+	'import sysconfig',
+	'get_config_var = sysconfig.get_config_var',
+	'def get_python_lib(standard_lib=0, prefix=None, plat_specific=0):',
+	"\treturn sysconfig.get_path('platlib' if plat_specific else 'purelib', vars={'base': prefix, 'platbase': prefix} if prefix else None)",
+]
 
 @before_method('process_source')
 @feature('py')
