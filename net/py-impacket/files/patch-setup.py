--- setup.py.orig
+++ setup.py
@@ -41,12 +41,6 @@
 except Exception:
     VER_LOCAL = ""
 
-if platform.system() != 'Darwin':
-    data_files = [(os.path.join('share', 'doc', PACKAGE_NAME), ['README.md', 'LICENSE']+glob.glob('doc/*'))]
-else:
-    data_files = []
-
-
 def read(fname):
     return open(os.path.join(os.path.dirname(__file__), fname)).read()
 
@@ -69,8 +63,6 @@
               'impacket.examples.ntlmrelayx.servers.socksplugins', 'impacket.examples.ntlmrelayx.utils',
               'impacket.examples.ntlmrelayx.attacks', 'impacket.examples.ntlmrelayx.attacks.httpattacks'],
     scripts=glob.glob(os.path.join('examples', '*.py')),
-    data_files=data_files,
-
     install_requires=['pyasn1>=0.2.3', 'pyasn1_modules', 'pycryptodomex', 'pyOpenSSL', 'six', 'ldap3>=2.5,!=2.5.2,!=2.5.0,!=2.6',
                       'ldapdomaindump>=0.9.0', 'flask>=1.0', 'charset_normalizer'],
     extras_require={':sys_platform=="win32"': ['pyreadline3'],
