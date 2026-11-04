--- metricbeat/internal/metrics/cpu/metrics_freebsd_test.go.orig	1970-01-01 00:00:00 UTC
+++ metricbeat/internal/metrics/cpu/metrics_freebsd_test.go
@@ -0,0 +1,32 @@
+//go:build freebsd
+// +build freebsd
+
+package cpu
+
+import (
+	"os"
+	"path/filepath"
+	"testing"
+)
+
+// Exercise repeated polling with an explicit hostfs so it must neither use
+// the default mount nor leave the statistics file open between samples.
+func TestConfiguredHostFS(t *testing.T) {
+	root := t.TempDir()
+	proc := filepath.Join(root, "proc")
+	if err := os.Mkdir(proc, 0755); err != nil {
+		t.Fatal(err)
+	}
+	if err := os.WriteFile(filepath.Join(proc, "stat"), []byte("cpu 100 20 30 400\ncpu0 100 20 30 400\n"), 0644); err != nil {
+		t.Fatal(err)
+	}
+	for i := 0; i < 256; i++ {
+		sample, err := Get(root)
+		if err != nil {
+			t.Fatalf("sample %d: %v", i, err)
+		}
+		if sample.totals.Total() != 550 || len(sample.list) != 1 || sample.list[0].Total() != 550 {
+			t.Fatalf("sample %d: unexpected CPU counters: %+v", i, sample)
+		}
+	}
+}
