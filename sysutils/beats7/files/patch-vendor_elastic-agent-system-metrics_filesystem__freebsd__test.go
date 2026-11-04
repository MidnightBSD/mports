--- vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_freebsd_test.go.orig	1970-01-01 00:00:00 UTC
+++ vendor/github.com/elastic/elastic-agent-system-metrics/metric/system/filesystem/filesystem_freebsd_test.go
@@ -0,0 +1,163 @@
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
+	"errors"
+	"syscall"
+	"testing"
+
+	"github.com/elastic/elastic-agent-system-metrics/metric/system/resolve"
+)
+
+func testMount(directory, device, fsType string) syscall.Statfs_t {
+	var stat syscall.Statfs_t
+	for _, field := range []struct {
+		text string
+		buf  []int8
+	}{
+		{directory, stat.Mntonname[:]},
+		{device, stat.Mntfromname[:]},
+		{fsType, stat.Fstypename[:]},
+	} {
+		for i := range field.text {
+			field.buf[i] = int8(field.text[i])
+		}
+	}
+	return stat
+}
+
+func TestReadMountsShrinkAndFilter(t *testing.T) {
+	calls := 0
+	mounts, err := readMounts(func(buf []syscall.Statfs_t, flags int) (int, error) {
+		if flags != mntNowait {
+			t.Fatalf("unexpected flags: %d", flags)
+		}
+		if buf == nil {
+			return 4, nil
+		}
+		buf[0] = testMount("/disk with spaces", "/dev/test disk", "ufs")
+		buf[1] = testMount("/dev", "devfs", "devfs")
+		return 2, nil
+	}, func(fs FSStat) bool {
+		calls++
+		return fs.Type == "ufs"
+	})
+	if err != nil || len(mounts) != 1 || calls != 2 {
+		t.Fatalf("mounts=%+v calls=%d err=%v", mounts, calls, err)
+	}
+	if fs := mounts[0]; fs.Directory != "/disk with spaces" || fs.Device != "/dev/test disk" || fs.Type != "ufs" {
+		t.Fatalf("incorrect mount metadata: %+v", fs)
+	}
+}
+
+func TestReadMountsGrowthFromZero(t *testing.T) {
+	fills := 0
+	mounts, err := readMounts(func(buf []syscall.Statfs_t, _ int) (int, error) {
+		if buf == nil {
+			return 0, nil
+		}
+		fills++
+		if len(buf) < 3 {
+			return len(buf), nil
+		}
+		buf[0] = testMount("/", "/dev/root", "ufs")
+		buf[1] = testMount("/data", "pool/data", "zfs")
+		return 2, nil
+	}, func(FSStat) bool { return true })
+	if err != nil || len(mounts) != 2 || fills < 2 || mounts[1].Directory != "/data" {
+		t.Fatalf("mounts=%+v fills=%d err=%v", mounts, fills, err)
+	}
+}
+
+func TestReadMountsEmpty(t *testing.T) {
+	mounts, err := readMounts(func([]syscall.Statfs_t, int) (int, error) { return 0, nil }, func(FSStat) bool {
+		t.Fatal("filter called for an empty mount table")
+		return true
+	})
+	if err != nil || len(mounts) != 0 {
+		t.Fatalf("mounts=%+v err=%v", mounts, err)
+	}
+}
+
+func TestReadMountsErrors(t *testing.T) {
+	for _, failCount := range []bool{true, false} {
+		_, err := readMounts(func(buf []syscall.Statfs_t, _ int) (int, error) {
+			if buf == nil && !failCount {
+				return 1, nil
+			}
+			return -1, syscall.EIO
+		}, func(FSStat) bool { return true })
+		if !errors.Is(err, syscall.EIO) {
+			t.Fatalf("count failure=%v: error lost: %v", failCount, err)
+		}
+	}
+}
+
+func TestReadMountsPersistentGrowth(t *testing.T) {
+	calls := 0
+	_, err := readMounts(func(buf []syscall.Statfs_t, _ int) (int, error) {
+		calls++
+		if buf == nil {
+			return 1, nil
+		}
+		return len(buf), nil
+	}, func(FSStat) bool { return true })
+	if err == nil || calls > 10 {
+		t.Fatalf("unbounded or silent mount truncation: calls=%d err=%v", calls, err)
+	}
+}
+
+func TestFreeBSDMountStrings(t *testing.T) {
+	for _, tc := range []struct {
+		raw  []int8
+		want string
+	}{
+		{nil, ""},
+		{[]int8{'a', 0, 'b'}, "a"},
+		{[]int8{'a', ' ', 'b'}, "a b"},
+		{[]int8{-1, 0}, "\xff"},
+	} {
+		if got := byteListToString(tc.raw); got != tc.want {
+			t.Errorf("raw=%v got=%q want=%q", tc.raw, got, tc.want)
+		}
+	}
+}
+
+func TestFreeBSDNativeFilesystems(t *testing.T) {
+	// No proc mount file exists under this hostfs path. Enumeration is native.
+	hostfs := resolve.NewTestResolver(t.TempDir())
+	mounts, err := GetFilesystems(hostfs, func(fs FSStat) bool { return fs.Directory == "/" })
+	if err != nil || len(mounts) != 1 {
+		t.Fatalf("native root mount: mounts=%+v err=%v", mounts, err)
+	}
+	root := &mounts[0]
+	if root.Device == "" || root.Type == "" {
+		t.Fatalf("missing native mount metadata: %+v", root)
+	}
+	if err := root.GetUsage(); err != nil || root.Total.ValueOr(0) == 0 {
+		t.Fatalf("root statfs usage: %+v err=%v", root, err)
+	}
+	mounts, err = GetFilesystems(hostfs, func(FSStat) bool { return false })
+	if err != nil || len(mounts) != 0 {
+		t.Fatalf("filter not respected: mounts=%+v err=%v", mounts, err)
+	}
+}
