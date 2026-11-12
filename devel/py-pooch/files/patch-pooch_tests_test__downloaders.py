--- pooch/tests/test_downloaders.py.orig	2026-01-30 19:14:27 UTC
+++ pooch/tests/test_downloaders.py
@@ -580,3 +580,29 @@
         """Test passing an emtpy dict to headers."""
         downloader = DOIDownloader(headers={})
         assert downloader.headers == {}
+
+
+@pytest.mark.skipif(tqdm is None, reason="requires tqdm")
+@pytest.mark.parametrize("chunk_size", [7, 1024])
+def test_http_progressbar_unknown_length(httpserver, capsys, chunk_size):
+    """Finish progress from actual bytes for single or multiple chunks."""
+    import requests
+    from werkzeug.wrappers import Response
+
+    payload = b"An HTTP response streamed without Content-Length.\n"
+    httpserver.expect_request("/unknown-size").respond_with_handler(
+        lambda request: Response(iter([payload]), mimetype="application/octet-stream")
+    )
+    url = httpserver.url_for("/unknown-size")
+    response = requests.get(url, timeout=30)
+    response.raise_for_status()
+    assert "Content-Length" not in response.headers
+    assert response.content == payload
+    with TemporaryDirectory() as local_store:
+        outfile = os.path.join(local_store, "data.txt")
+        HTTPDownloader(progressbar=True, chunk_size=chunk_size)(url, outfile, None)
+        with open(outfile, "rb") as stream:
+            assert stream.read() == payload
+    printed = capsys.readouterr().err.split("\r")[-1].strip()
+    assert len(printed) == 79
+    assert printed.startswith("100%|")
