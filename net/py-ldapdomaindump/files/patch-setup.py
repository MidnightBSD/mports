--- setup.py.orig
+++ setup.py
@@ -10,6 +10,5 @@
       install_requires=['dnspython', 'ldap3>=2.5,!=2.5.2,!=2.5.0,!=2.6'],
       package_data={'ldapdomaindump': ['style.css']},
       include_package_data=True,
-      scripts=['bin/ldapdomaindump', 'bin/ldd2bloodhound', 'bin/ldd2pretty'],
       license="MIT",
       )
