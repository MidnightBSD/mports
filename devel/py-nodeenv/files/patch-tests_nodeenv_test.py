--- tests/nodeenv_test.py.orig
+++ tests/nodeenv_test.py
@@ -3471,7 +3471,7 @@
     src_dir = tmpdir.join('src')
     node_src_dir = src_dir.join('node-v%s' % node_version)
     with mock.patch.object(nodeenv.shutil, 'which',
-                           return_value=python2_path), \
+                           side_effect=lambda name: '/usr/bin/make' if name == 'make' else python2_path), \
             mock.patch.object(nodeenv, 'callit') as mck:
         nodeenv.build_node_from_src(
             str(tmpdir.join('env')), str(src_dir), str(node_src_dir), args)
@@ -3504,7 +3504,10 @@
         './configure', 'make', 'make install']
     for c in calls:
         assert c[0][3] == str(node_src_dir)
-        assert not _build_env(c)
+        expected = ({'CC': os.environ.get('CC', 'cc'),
+                     'CXX': os.environ.get('CXX', 'c++')}
+                    if nodeenv.is_MIDNIGHTBSD else {})
+        assert _build_env(c) == expected
     assert not src_dir.join('tmpbin').exists()


@@ -3521,7 +3524,10 @@
     assert [c[0][0][0] for c in calls] == [
         './configure', 'make', 'make install']
     for c in calls:
-        assert not _build_env(c)
+        expected = ({'CC': os.environ.get('CC', 'cc'),
+                     'CXX': os.environ.get('CXX', 'c++')}
+                    if nodeenv.is_MIDNIGHTBSD else {})
+        assert _build_env(c) == expected
     assert not src_dir.join('tmpbin').exists()


@@ -3555,3 +3561,73 @@
     """
     with pytest.raises(OSError, match='python2.*' + node_version):
         _build_node_from_src(tmpdir, node_version, None)
+
+@pytest.mark.skipif(not nodeenv.is_MIDNIGHTBSD, reason='MidnightBSD defaults')
+def test_midnightbsd_source_defaults_and_explicit_options():
+    parser = nodeenv.make_parser()
+    default = parser.parse_args(['/tmp/nodeenv-test'])
+    assert default.prebuilt is False
+    assert default.make_path == 'gmake'
+    explicit = parser.parse_args([
+        '--prebuilt', '--make=/custom/make', '--node=13.1.0', '/tmp/nodeenv-test'])
+    assert explicit.prebuilt is True
+    assert explicit.make_path == '/custom/make'
+    assert explicit.node == '13.1.0'
+
+
+@pytest.mark.skipif(not nodeenv.is_MIDNIGHTBSD, reason='MidnightBSD defaults')
+def test_midnightbsd_source_respects_compiler_environment(tmpdir):
+    with mock.patch.dict(os.environ, {'CC': 'custom-cc', 'CXX': 'custom-cxx'}):
+        _, _, calls = _build_node_from_src(tmpdir, '22.11.0', None)
+    assert '--dest-os=freebsd' in calls[0][0][0]
+    for call in calls:
+        assert _build_env(call) == {'CC': 'custom-cc', 'CXX': 'custom-cxx'}
+
+
+@pytest.mark.skipif(not nodeenv.is_MIDNIGHTBSD, reason='MidnightBSD defaults')
+def test_midnightbsd_source_missing_make_fails(tmpdir):
+    args = mock.Mock(node='22.11.0', load_average=None, jobs='2',
+                     without_ssl=False, debug=False, profile=False,
+                     make_path='missing-make', verbose=False)
+    with mock.patch.object(nodeenv.shutil, 'which', return_value=None):
+        with pytest.raises(OSError, match='GNU make is required'):
+            nodeenv.build_node_from_src(str(tmpdir.join('env')),
+                                        str(tmpdir.join('src')),
+                                        str(tmpdir.join('source')), args)
+
+@pytest.mark.skipif(not nodeenv.is_MIDNIGHTBSD, reason='MidnightBSD defaults')
+@pytest.mark.parametrize('without_ssl', [False, True])
+def test_midnightbsd_node13_ssl_option(tmpdir, without_ssl):
+    args = mock.Mock(node='13.1.0', load_average=None, jobs='2',
+                     without_ssl=without_ssl, debug=False, profile=False,
+                     make_path='gmake', verbose=False)
+    with mock.patch.object(nodeenv.shutil, 'which', return_value='/usr/bin/tool'), \
+            mock.patch.object(nodeenv.subprocess, 'call', side_effect=[0, 1]), \
+            mock.patch.object(nodeenv, 'callit') as calls:
+        nodeenv.build_node_from_src(str(tmpdir.join('env')),
+                                    str(tmpdir.join('src')),
+                                    str(tmpdir.join('source')), args)
+    configure = calls.call_args_list[0][0][0]
+    assert ('--without-ssl' in configure) is without_ssl
+    assert ('--openssl-no-asm' in configure) is not without_ssl
+
+@pytest.mark.skipif(not nodeenv.is_MIDNIGHTBSD, reason='MidnightBSD defaults')
+@pytest.mark.parametrize('configure_source,expected', [
+    ("parser.add_argument('--v8-enable-temporal-support', action='store_true')\n", True),
+    ('parser.add_argument("--v8-enable-temporal-support", action="store_true")\n', True),
+    ('# --v8-enable-temporal-support is not an argument here\n', False),
+    ('# legacy configure without Temporal support\n', False),
+])
+def test_midnightbsd_source_temporal_feature_detection(tmpdir, configure_source, expected):
+    src_dir = tmpdir.mkdir('src')
+    node_src_dir = src_dir.mkdir('node-v26.13.1')
+    node_src_dir.join('configure.py').write(configure_source)
+    args = mock.Mock(node='26.13.1', load_average=None, jobs='2',
+                     without_ssl=False, debug=False, profile=False,
+                     make_path='gmake', verbose=False)
+    with mock.patch.object(nodeenv.shutil, 'which', return_value='/usr/bin/gmake'), \
+            mock.patch.object(nodeenv, 'callit') as calls:
+        nodeenv.build_node_from_src(str(tmpdir.join('env')), str(src_dir),
+                                    str(node_src_dir), args)
+    configure = calls.call_args_list[0][0][0]
+    assert ('--v8-enable-temporal-support' in configure) is expected
