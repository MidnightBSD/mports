--- services/plugins/serviceDiscovery/serviceDiscovery.c.orig	2021-09-24 04:19:18 UTC
+++ services/plugins/serviceDiscovery/serviceDiscovery.c
@@ -108,6 +108,12 @@ VM_EMBED_VERSION(VMTOOLSD_VERSION_STRING);
 #define SERVICE_DISCOVERY_RPC_WAIT_TIME 100
 
 /*
+ * Defines the configuration to enable/disable version obtaining logic
+ */
+#define CONFNAME_SERVICEDISCOVERY_VERSION_CHECK "version-check-enabled"
+#define SERVICE_DISCOVERY_CONF_DEFAULT_VERSION_CHECK FALSE
+
+/*
  * Maximum number of keys that can be deleted by one operation
  */
 #define SERVICE_DISCOVERY_DELETE_CHUNK_SIZE 25
@@ -845,24 +851,27 @@ ServiceDiscoveryServerShutdown(gpointer src,
  *
  * Construct final paths of the scripts that will be used for execution.
  *
- *****************************************************************************
+ * @param[in] versionCheckEnabled  TRUE to include the SERVICE_DISCOVERY_KEY_VERSIONS
+ *                                 entry; FALSE to skip it (derived from config).
+ * *****************************************************************************
  */
 
 static void
-ConstructScriptPaths(void)
+ConstructScriptPaths(Bool versionCheckEnabled)
 {
    int i;
    gchar *scriptInstallDir;
 #if !defined(OPEN_VM_TOOLS)
    gchar *toolsInstallDir;
 #endif
+   int insertIndex = 0;
 
    if (gFullPaths != NULL) {
       return;
    }
 
    gFullPaths = g_array_sized_new(FALSE, TRUE, sizeof(KeyNameValue),
-                                  ARRAYSIZE(gKeyScripts));
+                                  ARRAYSIZE(gKeyScripts) - (versionCheckEnabled ? 0u : 1u));
 
 #if defined(OPEN_VM_TOOLS)
    scriptInstallDir = Util_SafeStrdup(VMTOOLS_SERVICE_DISCOVERY_SCRIPTS);
@@ -874,6 +883,15 @@ ConstructScriptPaths(void)
 #endif
 
    for (i = 0; i < ARRAYSIZE(gKeyScripts); ++i) {
+      /*
+       * Skip adding if:
+       * 1. Version check is disabled, AND
+       * 2. The keyName matches SERVICE_DISCOVERY_KEY_VERSIONS
+       */
+      if (!versionCheckEnabled &&
+         g_strcmp0(gKeyScripts[i].keyName, SERVICE_DISCOVERY_KEY_VERSIONS) == 0) {
+         continue;
+      }
       KeyNameValue tmp;
       tmp.keyName = g_strdup_printf("%s", gKeyScripts[i].keyName);
 #if defined(_WIN32)
@@ -883,7 +901,8 @@ ConstructScriptPaths(void)
       tmp.val = g_strdup_printf("%s%s%s", scriptInstallDir, DIRSEPS,
                                 gKeyScripts[i].val);
 #endif
-      g_array_insert_val(gFullPaths, i, tmp);
+      g_array_insert_val(gFullPaths, insertIndex, tmp);
+      insertIndex++;
    }
 
    g_free(scriptInstallDir);
@@ -951,14 +970,20 @@ ToolsOnLoad(ToolsAppCtx *ctx)
          }
       };
       gboolean disabled;
+      Bool versionCheckEnabled;
 
       regData.regs = VMTools_WrapArray(regs,
                                        sizeof *regs,
                                        ARRAYSIZE(regs));
+      versionCheckEnabled = VMTools_ConfigGetBoolean(
+         ctx->config,
+         CONFGROUPNAME_SERVICEDISCOVERY,
+         CONFNAME_SERVICEDISCOVERY_VERSION_CHECK,
+         SERVICE_DISCOVERY_CONF_DEFAULT_VERSION_CHECK);
       /*
        * Append scripts absolute paths based on installation dirs.
        */
-      ConstructScriptPaths();
+      ConstructScriptPaths(versionCheckEnabled);
 
       disabled =
          VMTools_ConfigGetBoolean(ctx->config,
