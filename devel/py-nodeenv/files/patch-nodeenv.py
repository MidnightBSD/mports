--- nodeenv.py.orig
+++ nodeenv.py
@@ -45,6 +45,7 @@
 abspath = os.path.abspath
 src_base_url = None

+is_MIDNIGHTBSD = sys.platform.startswith('midnightbsd')
 is_WIN = platform.system() == 'Windows'
 is_CYGWIN = platform.system().startswith(('CYGWIN', 'MSYS'))

@@ -79,8 +80,8 @@
     without_ssl = False
     debug = False
     profile = False
-    make = 'make'
-    prebuilt = True
+    make = 'gmake' if is_MIDNIGHTBSD else 'make'
+    prebuilt = not is_MIDNIGHTBSD
     ignore_ssl_certs = False
     with_certifi = False
     mirror = None
@@ -1134,6 +1135,11 @@

 def build_node_from_src(env_dir, src_dir, node_src_dir, args):
     env = {}
+    if is_MIDNIGHTBSD:
+        env['CC'] = os.environ.get('CC', 'cc')
+        env['CXX'] = os.environ.get('CXX', 'c++')
+        if not shutil.which(args.make_path):
+            raise OSError('GNU make is required to build Node.js; install gmake')
     make_param_names = ['load-average', 'jobs']
     make_param_values = map(
         lambda x: getattr(args, x.replace('-', '_')),
@@ -1168,10 +1174,41 @@
             env['PATH'] = '{}:{}'.format(node_tmpbin_dir,
                                          os.environ.get('PATH', ''))

+    if is_MIDNIGHTBSD and args.node == '13.1.0':
+        if not shutil.which('python3.11'):
+            raise OSError('python3.11 is required to build Node.js 13.1.0')
+        patch_path = join(os.path.dirname(abspath(__file__)),
+                          'nodeenv-node-v13.1.0-midnightbsd.patch')
+        check_cmd = ['patch', '-f', '-C', '-p1', '-i', patch_path]
+        with open(os.devnull, 'wb') as devnull:
+            reverse_status = subprocess.call(check_cmd + ['-R'],
+                                             cwd=node_src_dir,
+                                             stdout=devnull, stderr=devnull)
+            forward_status = subprocess.call(check_cmd + ['-N'],
+                                             cwd=node_src_dir,
+                                             stdout=devnull, stderr=devnull)
+        if reverse_status != 0:
+            if forward_status != 0:
+                raise OSError('Node.js 13.1.0 source cannot accept the MidnightBSD compatibility patch')
+            callit(['patch', '-f', '-N', '-p1', '-i', patch_path],
+                   args.verbose, False, node_src_dir, env)
+
     conf_cmd = [
         './configure',
         '--prefix=%s' % _quote(env_dir)
     ]
+    if is_MIDNIGHTBSD:
+        conf_cmd.append('--dest-os=freebsd')
+        configure_py = join(node_src_dir, 'configure.py')
+        if os.path.isfile(configure_py):
+            with open(configure_py, encoding='utf-8') as configure_file:
+                configure_text = configure_file.read()
+            temporal_option = (
+                r"add_argument\s*\(\s*[\'\"]--v8-enable-temporal-support[\'\"]")
+            if re.search(temporal_option, configure_text):
+                conf_cmd.append('--v8-enable-temporal-support')
+        if args.node == '13.1.0' and not args.without_ssl:
+            conf_cmd.append('--openssl-no-asm')
     if args.without_ssl:
         conf_cmd.append('--without-ssl')
     if args.debug:
