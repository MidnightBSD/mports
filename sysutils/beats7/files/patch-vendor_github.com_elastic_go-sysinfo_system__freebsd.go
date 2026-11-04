--- vendor/github.com/elastic/go-sysinfo/system_freebsd.go.orig	1970-01-01 00:00:00 UTC
+++ vendor/github.com/elastic/go-sysinfo/system_freebsd.go
@@ -0,0 +1,149 @@
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
+	"strconv"
+	"strings"
+	"time"
+
+	"github.com/pkg/errors"
+	"github.com/shirou/gopsutil/cpu"
+	"github.com/shirou/gopsutil/mem"
+	"golang.org/x/sys/unix"
+
+	"github.com/elastic/go-sysinfo/internal/registry"
+	"github.com/elastic/go-sysinfo/providers/shared"
+	"github.com/elastic/go-sysinfo/types"
+)
+
+func init() {
+	registry.Register(freebsdProvider{})
+}
+
+type freebsdProvider struct{}
+
+type freebsdHost struct {
+	info types.HostInfo
+}
+
+func (freebsdProvider) Host() (types.Host, error) {
+	name, err := unix.Sysctl("kern.ostype")
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get OS name")
+	}
+	release, err := unix.Sysctl("kern.osrelease")
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get OS release")
+	}
+	arch, err := unix.Sysctl("hw.machine_arch")
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get architecture")
+	}
+	boot, err := unix.SysctlTimeval("kern.boottime")
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get boot time")
+	}
+	hostname, err := os.Hostname()
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get hostname")
+	}
+	ips, macs, err := shared.Network()
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get network information")
+	}
+	zone, offset := time.Now().Zone()
+	return &freebsdHost{info: types.HostInfo{
+		Architecture:      arch,
+		BootTime:          time.Unix(int64(boot.Sec), int64(boot.Usec)*1000),
+		Hostname:          hostname,
+		IPs:               ips,
+		KernelVersion:     release,
+		MACs:              macs,
+		OS:                freebsdOSInfo(name, release),
+		Timezone:          zone,
+		TimezoneOffsetSec: offset,
+	}}, nil
+}
+
+func freebsdOSInfo(name, release string) *types.OSInfo {
+	info := &types.OSInfo{
+		Type:     "unix",
+		Family:   strings.ToLower(name),
+		Platform: strings.ToLower(name),
+		Name:     name,
+		Version:  release,
+	}
+	parts := strings.SplitN(release, ".", 3)
+	fields := []*int{&info.Major, &info.Minor, &info.Patch}
+	for i, part := range parts {
+		if end := strings.IndexFunc(part, func(r rune) bool { return r < '0' || r > '9' }); end >= 0 {
+			part = part[:end]
+		}
+		*fields[i], _ = strconv.Atoi(part)
+	}
+	return info
+}
+
+func (h *freebsdHost) Info() types.HostInfo { return h.info }
+
+func (*freebsdHost) CPUTime() (types.CPUTimes, error) {
+	times, err := cpu.Times(false)
+	if err != nil {
+		return types.CPUTimes{}, errors.Wrap(err, "failed to get host CPU times")
+	}
+	if len(times) != 1 {
+		return types.CPUTimes{}, errors.New("expected aggregate host CPU times")
+	}
+	t := times[0]
+	duration := func(seconds float64) time.Duration { return time.Duration(seconds * float64(time.Second)) }
+	return types.CPUTimes{
+		User: duration(t.User), System: duration(t.System), Idle: duration(t.Idle),
+		Nice: duration(t.Nice), IRQ: duration(t.Irq), IOWait: duration(t.Iowait),
+		SoftIRQ: duration(t.Softirq), Steal: duration(t.Steal),
+	}, nil
+}
+
+func (*freebsdHost) Memory() (*types.HostMemoryInfo, error) {
+	physical, err := mem.VirtualMemory()
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get host physical memory")
+	}
+	devices, err := unix.SysctlUint32("vm.nswapdev")
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get host swap device count")
+	}
+	swap, err := freebsdSwapMemory(devices)
+	if err != nil {
+		return nil, errors.Wrap(err, "failed to get host swap memory")
+	}
+	return &types.HostMemoryInfo{
+		Total: physical.Total, Used: physical.Total - physical.Free, Free: physical.Free,
+		Available:    physical.Available,
+		VirtualTotal: swap.Total, VirtualUsed: swap.Used, VirtualFree: swap.Free,
+	}, nil
+}
+
+// gopsutil reports an error when no swap devices are configured.
+func freebsdSwapMemory(devices uint32) (*mem.SwapMemoryStat, error) {
+	if devices == 0 {
+		return &mem.SwapMemoryStat{}, nil
+	}
+	return mem.SwapMemory()
+}
