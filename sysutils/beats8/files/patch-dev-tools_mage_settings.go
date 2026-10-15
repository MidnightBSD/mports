--- dev-tools/mage/settings.go.orig	2026-09-30 17:45:00 UTC
+++ dev-tools/mage/settings.go
@@ -34 +34,0 @@
-	"github.com/magefile/mage/sh"
@@ -283 +282 @@
-		commitHash, err = sh.Output("git", "rev-parse", "HEAD")
+		commitHash = "%%BEATSVERSION%%"
