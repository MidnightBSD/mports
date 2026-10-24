--- vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_freebsd.go.orig	1970-01-01 00:00:00 UTC
+++ vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_freebsd.go
@@ -0,0 +1,88 @@
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
+//go:build freebsd
+// +build freebsd
+
+package filesystem
+
+import (
+	"fmt"
+	"syscall"
+)
+
+// MNT_NOWAIT from sys/mount.h; use cached statistics without waiting for I/O.
+const mntNowait = 2
+
+func parseMounts(_ string, filter func(FSStat) bool) ([]FSStat, error) {
+	return readMounts(syscall.Getfsstat, filter)
+}
+
+func readMounts(getfsstat func([]syscall.Statfs_t, int) (int, error), filter func(FSStat) bool) ([]FSStat, error) {
+	count, err := getfsstat(nil, mntNowait)
+	if err != nil {
+		return nil, fmt.Errorf("getfsstat: %w", err)
+	}
+	size := count + 1
+	if count < 0 || size <= count {
+		return nil, fmt.Errorf("invalid getfsstat mount count: %d", count)
+	}
+
+	for attempt := 0; attempt < 5; attempt++ {
+		buf := make([]syscall.Statfs_t, size)
+		n, err := getfsstat(buf, mntNowait)
+		if err != nil {
+			return nil, fmt.Errorf("getfsstat: %w", err)
+		}
+		if n < 0 || n > len(buf) {
+			return nil, fmt.Errorf("invalid getfsstat result count: %d", n)
+		}
+		// A full buffer may be truncated if mounts appeared after the count.
+		if n == len(buf) {
+			if size > int(^uint(0)>>1)/2 {
+				return nil, fmt.Errorf("getfsstat mount table is too large")
+			}
+			size *= 2
+			continue
+		}
+
+		mounts := make([]FSStat, 0, n)
+		for _, stat := range buf[:n] {
+			fs := FSStat{
+				Directory: byteListToString(stat.Mntonname[:]),
+				Device:    byteListToString(stat.Mntfromname[:]),
+				Type:      byteListToString(stat.Fstypename[:]),
+			}
+			if filter(fs) {
+				mounts = append(mounts, fs)
+			}
+		}
+		return mounts, nil
+	}
+	return nil, fmt.Errorf("getfsstat mount table kept growing")
+}
+
+func byteListToString(raw []int8) string {
+	buf := make([]byte, 0, len(raw))
+	for _, c := range raw {
+		if c == 0 {
+			break
+		}
+		buf = append(buf, byte(c))
+	}
+	return string(buf)
+}
