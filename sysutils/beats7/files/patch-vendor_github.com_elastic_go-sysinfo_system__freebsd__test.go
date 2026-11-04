--- vendor/github.com/elastic/go-sysinfo/system_freebsd_test.go.orig	1970-01-01 00:00:00 UTC
+++ vendor/github.com/elastic/go-sysinfo/system_freebsd_test.go
@@ -0,0 +1,112 @@
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
+package sysinfo
+
+import (
+	"os"
+	"os/exec"
+	"strconv"
+	"strings"
+	"testing"
+	"time"
+
+	"golang.org/x/sys/unix"
+)
+
+func TestFreeBSDOSInfo(t *testing.T) {
+	for _, tc := range []struct {
+		name, release, platform string
+		major, minor, patch     int
+	}{
+		{"MidnightBSD", "4.2", "midnightbsd", 4, 2, 0},
+		{"MidnightBSD", "4.0.4", "midnightbsd", 4, 0, 4},
+		{"FreeBSD", "13.5-STABLE", "freebsd", 13, 5, 0},
+		{"FreeBSD", "14.0-RELEASE-p2", "freebsd", 14, 0, 0},
+	} {
+		t.Run(tc.name+"-"+tc.release, func(t *testing.T) {
+			info := freebsdOSInfo(tc.name, tc.release)
+			if info.Name != tc.name || info.Version != tc.release || info.Type != "unix" ||
+				info.Family != tc.platform || info.Platform != tc.platform ||
+				info.Major != tc.major || info.Minor != tc.minor || info.Patch != tc.patch {
+				t.Fatalf("unexpected OS information: %+v", info)
+			}
+		})
+	}
+}
+
+func TestFreeBSDHost(t *testing.T) {
+	h, err := Host()
+	if err != nil {
+		t.Fatal(err)
+	}
+	info := h.Info()
+	name, err := unix.Sysctl("kern.ostype")
+	if err != nil {
+		t.Fatal(err)
+	}
+	release, err := unix.Sysctl("kern.osrelease")
+	if err != nil {
+		t.Fatal(err)
+	}
+	hostname, err := os.Hostname()
+	if err != nil {
+		t.Fatal(err)
+	}
+	if info.OS == nil || info.OS.Name != name || info.OS.Version != release ||
+		info.KernelVersion != release || info.Hostname != hostname || info.Architecture == "" {
+		t.Fatal("host information does not match the running system")
+	}
+	if info.BootTime.IsZero() || info.BootTime.After(time.Now()) {
+		t.Fatal("invalid host boot time")
+	}
+	times, err := h.CPUTime()
+	if err != nil {
+		t.Fatal(err)
+	}
+	if times.Total() <= 0 {
+		t.Fatal("missing host CPU times")
+	}
+	memory, err := h.Memory()
+	if err != nil {
+		t.Fatal(err)
+	}
+	rawTotal, err := exec.Command("/sbin/sysctl", "-n", "hw.physmem").Output()
+	if err != nil {
+		t.Fatal(err)
+	}
+	total, err := strconv.ParseUint(strings.TrimSpace(string(rawTotal)), 10, 64)
+	if err != nil {
+		t.Fatal(err)
+	}
+	if memory.Total != total || memory.Free > memory.Total ||
+		memory.Available < memory.Free || memory.Available > memory.Total ||
+		memory.Used+memory.Free != memory.Total ||
+		memory.VirtualUsed+memory.VirtualFree != memory.VirtualTotal {
+		t.Fatal("invalid host memory accounting")
+	}
+}
+
+func TestFreeBSDNoSwap(t *testing.T) {
+	swap, err := freebsdSwapMemory(0)
+	if err != nil {
+		t.Fatal(err)
+	}
+	if swap.Total != 0 || swap.Used != 0 || swap.Free != 0 {
+		t.Fatal("swapless host reports swap memory")
+	}
+}
