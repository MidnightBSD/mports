--- src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test/build.rs.orig	2026-03-02 00:00:00 UTC
+++ src/tools/rust-analyzer/crates/proc-macro-srv/proc-macro-test/build.rs
@@ -110,12 +110,22 @@ fn main() {
     let mut artifact_path = None;
+    let mut fallback_artifact_path = None;
     for message in Message::parse_stream(output.stdout.as_slice()) {
         if let Message::CompilerArtifact(artifact) = message.unwrap()
             && artifact.target.kind.contains(&cargo_metadata::TargetKind::ProcMacro)
-            && (artifact.package_id.repr.starts_with(&repr) || artifact.package_id.repr == pkgid)
         {
-            artifact_path = Some(PathBuf::from(&artifact.filenames[0]));
+            let Some(filename) = artifact.filenames.first() else {
+                continue;
+            };
+            let filename = PathBuf::from(filename);
+            if artifact.package_id.repr.starts_with(&repr) || artifact.package_id.repr == pkgid {
+                artifact_path = Some(filename);
+            } else {
+                fallback_artifact_path = Some(filename);
+            }
         }
     }
-
+
     // This file is under `target_dir` and is already under `OUT_DIR`.
-    let artifact_path = artifact_path.expect("no dylib for proc-macro-test-impl found");
+    let artifact_path = artifact_path
+        .or(fallback_artifact_path)
+        .expect("no dylib for proc-macro-test-impl found");
