--- scripts/build/deps/brotli.ts.orig	2026-04-26 13:24:56 UTC
+++ scripts/build/deps/brotli.ts
@@ -36,6 +36,9 @@ export const brotli: Dependency = {
     commit: BROTLI_COMMIT,
   }),
 
+  // CVE-2026-111497: upstream 1.1.x backport (google/brotli da98063, v1.1.1).
+  patches: ["patches/brotli/CVE-2026-111497.patch"],
+
   build: cfg => {
     const spec: DirectBuild = {
       kind: "direct",
