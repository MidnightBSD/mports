--- /dev/null
+++ cherrypy/test/test_owned_resources.py
@@ -0,0 +1,225 @@
+"""Lifecycle checks for resources opened by CherryPy during a request."""
+
+import builtins
+import io
+import tempfile
+from unittest.mock import patch
+
+import pytest
+
+import cherrypy
+from cherrypy import _cpreqbody, _cprequest
+from cherrypy.lib import httputil, static
+
+
+@pytest.fixture
+def active_request():
+    previous_request, previous_response = cherrypy.serving.request, cherrypy.serving.response
+    request = _cprequest.Request(httputil.Host('127.0.0.1', 80), httputil.Host('127.0.0.1', 1))
+    request.hooks = request.hooks.copy()
+    request.headers = httputil.HeaderMap()
+    request.protocol = (1, 1)
+    request.stage = 'handler'
+    cherrypy.serving.load(request, _cprequest.Response())
+    try:
+        yield request
+    finally:
+        request.close()
+        cherrypy.serving.load(previous_request, previous_response)
+
+
+def parse_body(request, data, content_type):
+    request.headers = httputil.HeaderMap()
+    request.headers['Content-Type'] = content_type
+    request.headers['Content-Length'] = str(len(data))
+    source = io.BytesIO(data)
+    body = _cpreqbody.RequestBody(source, request.headers)
+    body.process()
+    return body, source
+
+
+def test_multipart_files_remain_open_until_end_hooks(active_request):
+    data = (b'--outer\r\nContent-Disposition: form-data; name="field"\r\n\r\n'
+            + b'x' * 1200 + b'\r\n--outer\r\n'
+            + b'Content-Disposition: form-data; name="upload"; filename="file.txt"\r\n\r\n'
+            + b'uploaded data\r\n--outer--\r\n')
+    created = []
+    make = tempfile.TemporaryFile
+    def track():
+        fileobj = make()
+        created.append(fileobj)
+        return fileobj
+    with patch.object(_cpreqbody.tempfile, 'TemporaryFile', side_effect=track):
+        body, source = parse_body(active_request, data, 'multipart/form-data; boundary=outer')
+    assert body.params['field'] == 'x' * 1200
+    upload = body.params['upload'].file
+    assert upload.read() == b'uploaded data'
+    assert len(created) == 2 and all(not f.closed for f in created)
+    observed = []
+    active_request.hooks.attach('on_end_request', lambda: observed.append(all(not f.closed for f in created)))
+    active_request.close()
+    assert observed == [True]
+    assert all(f.closed for f in created)
+    assert not source.closed
+
+
+def test_nested_multipart_files_are_closed(active_request):
+    data = (b'--outer\r\nContent-Type: multipart/mixed; boundary=inner\r\n\r\n'
+            b'--inner\r\nContent-Disposition: attachment; filename="nested.txt"\r\n\r\n'
+            b'nested data\r\n--inner--\r\n--outer--\r\n')
+    created = []
+    make = tempfile.TemporaryFile
+    def track():
+        fileobj = make()
+        created.append(fileobj)
+        return fileobj
+    with patch.object(_cpreqbody.tempfile, 'TemporaryFile', side_effect=track):
+        body, source = parse_body(active_request, data, 'multipart/form-data; boundary=outer')
+    assert len(created) == 1
+    assert not created[0].closed
+    created[0].seek(0)
+    assert created[0].read() == b'nested data'
+    active_request.close()
+    assert created[0].closed and not source.closed
+
+
+def test_hook_failure_closes_owned_but_not_custom_file(active_request):
+    default = _cpreqbody.Entity(io.BytesIO(), httputil.HeaderMap()).make_file()
+    custom = tempfile.TemporaryFile()
+    class CustomEntity(_cpreqbody.Entity):
+        def make_file(self):
+            return custom
+    borrowed = CustomEntity(io.BytesIO(), httputil.HeaderMap()).make_file()
+    observed = []
+    hook_owned = []
+    def fail():
+        observed.append((default.closed, borrowed.closed))
+        hook_owned.append(_cpreqbody.Entity(io.BytesIO(), httputil.HeaderMap()).make_file())
+        raise RuntimeError('end hook')
+    active_request.hooks.attach('on_end_request', fail, priority=10)
+    active_request.hooks.attach(
+        'on_end_request', lambda: observed.append((default.closed, borrowed.closed)),
+        failsafe=True, priority=20,
+    )
+    with pytest.raises(RuntimeError, match='end hook'):
+        active_request.close()
+    assert observed == [(False, False), (False, False)]
+    assert default.closed and hook_owned[0].closed and not borrowed.closed
+    borrowed.close()
+
+
+def test_standalone_entity_owns_its_file():
+    request = cherrypy.serving.request
+    assert request.stage is None
+    fileobj = _cpreqbody.Entity(io.BytesIO(), httputil.HeaderMap()).make_file()
+    try:
+        assert not fileobj.closed
+    finally:
+        fileobj.close()
+
+
+@pytest.mark.parametrize('range_header', ['bytes=0-2', 'bytes=0-1,4-5', 'bytes=999-1000'])
+def test_static_owned_file_range_cleanup(active_request, tmp_path, range_header):
+    path = tmp_path / 'data.txt'
+    path.write_bytes(b'abcdef')
+    active_request.headers['Range'] = range_header
+    opened = []
+    def track(*args, **kwargs):
+        fileobj = builtins.open(*args, **kwargs)
+        opened.append(fileobj)
+        return fileobj
+    with patch.object(static, 'open', create=True, side_effect=track):
+        if range_header == 'bytes=999-1000':
+            with pytest.raises(cherrypy.HTTPError) as exc:
+                static.serve_file(str(path))
+            assert exc.value.status == 416
+        else:
+            body = static.serve_file(str(path))
+            content = b''.join(body)
+            if ',' in range_header:
+                assert b'Content-range: bytes 0-1/6' in content
+                assert b'Content-range: bytes 4-5/6' in content
+                assert b'ab' in content and b'ef' in content
+            else:
+                assert content == b'abc'
+    assert len(opened) == 1 and not opened[0].closed
+    active_request.close()
+    assert opened[0].closed
+
+
+def test_static_abort_and_borrowed_file(active_request, tmp_path):
+    path = tmp_path / 'data.txt'
+    path.write_bytes(b'abcdef')
+    active_request.headers['Range'] = 'bytes=0-2'
+    opened = []
+    def track(*args, **kwargs):
+        fileobj = builtins.open(*args, **kwargs)
+        opened.append(fileobj)
+        return fileobj
+    with patch.object(static, 'open', create=True, side_effect=track):
+        body = static.serve_file(str(path))
+    assert not opened[0].closed
+    active_request.close()
+    assert opened[0].closed
+    body.close()
+
+
+def test_serve_fileobj_remains_caller_owned(active_request, tmp_path):
+    path = tmp_path / 'borrowed.txt'
+    path.write_bytes(b'abcdef')
+    borrowed = path.open('rb')
+    active_request.headers['Range'] = 'bytes=0-2'
+    assert b''.join(static.serve_fileobj(borrowed)) == b'abc'
+    active_request.close()
+    assert not borrowed.closed
+    borrowed.close()
+
+
+@pytest.mark.parametrize('consume', [False, True])
+def test_wsgi_static_stream_lifetime(tmp_path, consume):
+    from wsgiref.util import setup_testing_defaults
+
+    path = tmp_path / 'stream.txt'
+    path.write_bytes(b'abcdef')
+    opened = []
+    def track(*args, **kwargs):
+        fileobj = builtins.open(*args, **kwargs)
+        opened.append(fileobj)
+        return fileobj
+    class Root:
+        @cherrypy.expose
+        def index(self):
+            cherrypy.response.stream = True
+            return static.serve_file(str(path))
+    environ = {}
+    setup_testing_defaults(environ)
+    environ['SERVER_PROTOCOL'] = 'HTTP/1.1'
+    environ['HTTP_RANGE'] = 'bytes=0-2'
+    statuses = []
+    def start_response(status, headers, exc_info=None):
+        statuses.append(status)
+        return lambda chunk: None
+    app = cherrypy.Application(Root())
+    with patch.object(static, 'open', create=True, side_effect=track):
+        response = app(environ, start_response)
+    assert statuses[0].startswith('206')
+    assert len(opened) == 1 and not opened[0].closed
+    if consume:
+        assert b''.join(response) == b'abc'
+        assert not opened[0].closed
+    response.close()
+    assert opened[0].closed
+
+
+def test_stack_close_failure_still_marks_request_closed(active_request):
+    def fail_close():
+        raise OSError('close failed')
+    active_request._owned_resources.callback(fail_close)
+    with pytest.raises(OSError, match='close failed'):
+        active_request.close()
+    assert active_request.stage == 'close'
+    later = _cpreqbody.Entity(io.BytesIO(), httputil.HeaderMap()).make_file()
+    try:
+        assert not later.closed
+    finally:
+        later.close()
