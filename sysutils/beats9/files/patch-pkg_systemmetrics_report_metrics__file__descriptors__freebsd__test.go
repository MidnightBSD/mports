--- pkg/systemmetrics/report/metrics_file_descriptors_freebsd_test.go.orig	1970-01-01 00:00:00 UTC
+++ pkg/systemmetrics/report/metrics_file_descriptors_freebsd_test.go
@@ -0,0 +1,72 @@
+// Licensed to Elasticsearch B.V. under one or more contributor
+// license agreements. See the NOTICE file distributed with
+// this work for additional information regarding copyright
+// ownership. Elasticsearch B.V. licenses this file to you under
+// the Apache License, Version 2.0 (the "License"); you may
+// not use this file except in compliance with the License.
+// You may obtain a copy of the License at
+//
+//     http://www.apache.org/licenses/LICENSE-2.0
+//
+// Unless required by applicable law or agreed to in writing,
+// software distributed under the License is distributed on an
+// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
+// KIND, either express or implied.  See the License for the
+// specific language governing permissions and limitations
+// under the License.
+
+//go:build freebsd && cgo
+
+package report
+
+import (
+	"os"
+	"syscall"
+	"testing"
+
+	"github.com/stretchr/testify/assert"
+	"github.com/stretchr/testify/require"
+
+	"github.com/elastic/beats/v7/pkg/systemmetrics/metric/system/process"
+	"github.com/elastic/beats/v7/pkg/systemmetrics/metric/system/resolve"
+	"github.com/elastic/elastic-agent-libs/logp/logptest"
+	"github.com/elastic/elastic-agent-libs/monitoring"
+)
+
+func TestFreeBSDSelfPid(t *testing.T) {
+	// No Linux procfs is available under this explicitly configured root.
+	pid, err := process.GetSelfPid(resolve.NewTestResolver(t.TempDir()))
+	require.NoError(t, err)
+	assert.Equal(t, os.Getpid(), pid)
+}
+
+func TestFreeBSDFDUsageReporter(t *testing.T) {
+	// Warm up Go's lazy descriptor initialization before comparing counts.
+	warm, err := os.Open("/dev/null")
+	require.NoError(t, err)
+	defer warm.Close()
+
+	registry := monitoring.NewRegistry()
+	SetupLinuxBSDFDMetrics(logptest.NewTestingLogger(t, ""), registry, nil)
+	snapshot := func() map[string]any {
+		values := map[string]any{}
+		registry.Do(monitoring.Full, func(key string, value any) {
+			values[key] = value
+		})
+		return values
+	}
+	before := snapshot()
+	require.Contains(t, before, "handles.open")
+	assert.Greater(t, before["handles.open"].(int64), int64(0))
+
+	var limits syscall.Rlimit
+	require.NoError(t, syscall.Getrlimit(syscall.RLIMIT_NOFILE, &limits))
+	assert.Equal(t, int64(limits.Cur), before["handles.limit.soft"])
+	assert.Equal(t, int64(limits.Max), before["handles.limit.hard"])
+
+	file, err := os.Open("/dev/null")
+	require.NoError(t, err)
+	defer file.Close()
+	after := snapshot()
+	assert.Equal(t, before["handles.open"].(int64)+1, after["handles.open"])
+}
