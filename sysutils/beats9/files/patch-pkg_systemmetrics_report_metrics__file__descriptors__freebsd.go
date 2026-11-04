--- pkg/systemmetrics/report/metrics_file_descriptors_freebsd.go.orig	1970-01-01 00:00:00 UTC
+++ pkg/systemmetrics/report/metrics_file_descriptors_freebsd.go
@@ -0,0 +1,68 @@
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
+	"syscall"
+
+	"github.com/elastic/beats/v7/pkg/systemmetrics/metric/system/process"
+	"github.com/elastic/elastic-agent-libs/logp"
+	"github.com/elastic/elastic-agent-libs/monitoring"
+	"github.com/elastic/go-sysinfo"
+	"github.com/elastic/go-sysinfo/types"
+)
+
+func SetupLinuxBSDFDMetrics(logger *logp.Logger, reg *monitoring.Registry, processStats *process.Stats) {
+	monitoring.NewFunc(reg, "handles", FDUsageReporter(logger, processStats), monitoring.Report)
+}
+
+func FDUsageReporter(logger *logp.Logger, _ *process.Stats) func(monitoring.Mode, monitoring.Visitor) {
+	return func(_ monitoring.Mode, v monitoring.Visitor) {
+		v.OnRegistryStart()
+		defer v.OnRegistryFinished()
+
+		self, err := sysinfo.Self()
+		if err != nil {
+			logger.Errorf("Error while retrieving self process: %v", err)
+			return
+		}
+		counter, ok := self.(types.OpenHandleCounter)
+		if !ok {
+			logger.Errorf("Self process provider does not support descriptor counts")
+			return
+		}
+		open, err := counter.OpenHandleCount()
+		if err != nil {
+			logger.Errorf("Error while retrieving open FDs information: %v", err)
+			return
+		}
+		var limits syscall.Rlimit
+		if err := syscall.Getrlimit(syscall.RLIMIT_NOFILE, &limits); err != nil {
+			logger.Errorf("Error while retrieving FD stats information: %v", err)
+			return
+		}
+
+		monitoring.ReportInt(v, "open", int64(open))
+		monitoring.ReportNamespace(v, "limit", func() {
+			monitoring.ReportInt(v, "hard", int64(limits.Max))
+			monitoring.ReportInt(v, "soft", int64(limits.Cur))
+		})
+	}
+}
