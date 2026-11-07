--- fakeredis/commands_mixins/scripting_mixin.py.orig
+++ fakeredis/commands_mixins/scripting_mixin.py
@@ -34,7 +34,14 @@ __LUA_RUNTIMES_MAP = {
 LUA_VERSION = os.getenv("FAKEREDIS_LUA_VERSION", "5.1")
 
 with lupa.allow_lua_module_loading():
-    LUA_MODULE = importlib.import_module(__LUA_RUNTIMES_MAP[LUA_VERSION])
+    try:
+        LUA_MODULE = importlib.import_module(__LUA_RUNTIMES_MAP[LUA_VERSION])
+    except ModuleNotFoundError as exc:
+        if "FAKEREDIS_LUA_VERSION" in os.environ or exc.name != __LUA_RUNTIMES_MAP[LUA_VERSION]:
+            raise
+        # A system-Lua Lupa build may only provide its default backend.
+        LUA_MODULE = lupa
+        LUA_MODULE.LuaRuntime
 
 LOGGER = logging.getLogger("fakeredis")
 REDIS_LOG_LEVELS = {
