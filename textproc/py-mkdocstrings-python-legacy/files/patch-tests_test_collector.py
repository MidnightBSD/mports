--- tests/test_collector.py.orig
+++ tests/test_collector.py
@@ -30,6 +30,6 @@
     with mock.patch("mkdocstrings_handlers.python.handler.json.loads") as m_loads:  # noqa: SIM117
         with pytest.raises(CollectionError) as excinfo:  # noqa: PT012
             m_loads.return_value = retval
-            handler = get_handler({}, _FakeMkDocsConfig, theme="material")  # type: ignore[arg-type]
+            handler = get_handler({}, _FakeMkDocsConfig, theme="material", custom_templates=None, mdx=[], mdx_config={})  # type: ignore[arg-type]
             assert handler.collect("", {})
             assert str(excinfo.value) == exp_res
