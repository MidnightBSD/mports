--- codex-rs/app-server-daemon/src/prepare_install.rs.orig	2026-10-01 13:13:37 UTC
+++ codex-rs/app-server-daemon/src/prepare_install.rs
@@ -477,6 +477,8 @@ fn platform_target() -> Result<&'static str> {
         ("linux", "aarch64") => Ok("aarch64-unknown-linux-musl"),
         ("linux", "x86_64") if cfg!(target_env = "gnu") => Ok("x86_64-unknown-linux-gnu"),
         ("linux", "x86_64") => Ok("x86_64-unknown-linux-musl"),
+        ("freebsd", "x86") => Ok("i686-unknown-freebsd"),
+        ("freebsd", "x86_64") => Ok("x86_64-unknown-freebsd"),
         ("windows", "aarch64") => Ok("aarch64-pc-windows-msvc"),
         ("windows", "x86_64") => Ok("x86_64-pc-windows-msvc"),
         (os, arch) => Err(anyhow!("unsupported packaged daemon platform {os}/{arch}")),
