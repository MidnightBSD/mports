--- internal/sourceanalysis/go.go.orig
+++ internal/sourceanalysis/go.go
@@ -24 +24 @@
-	cmd := exec.CommandContext(context.TODO(), "go", "version")
+	cmd := exec.CommandContext(context.TODO(), "go%%GO_SUFFIX%%", "version")
