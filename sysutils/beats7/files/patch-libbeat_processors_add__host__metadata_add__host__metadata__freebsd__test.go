--- libbeat/processors/add_host_metadata/add_host_metadata_freebsd_test.go.orig	1970-01-01 00:00:00 UTC
+++ libbeat/processors/add_host_metadata/add_host_metadata_freebsd_test.go
@@ -0,0 +1,97 @@
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
+package add_host_metadata
+
+import (
+	"net"
+	"os"
+	"testing"
+
+	"github.com/stretchr/testify/assert"
+	"github.com/stretchr/testify/require"
+	"golang.org/x/sys/unix"
+
+	"github.com/elastic/beats/v7/libbeat/beat"
+	"github.com/elastic/beats/v7/libbeat/common"
+	"github.com/elastic/beats/v7/libbeat/processors/util"
+)
+
+// Exercise the actual provider and processor together: an unsupported host
+// provider used to prevent both OS metadata and network addresses being added.
+func TestFreeBSDHostMetadata(t *testing.T) {
+	osName, err := unix.Sysctl("kern.ostype")
+	require.NoError(t, err)
+	release, err := unix.Sysctl("kern.osrelease")
+	require.NoError(t, err)
+	hostname, err := os.Hostname()
+	require.NoError(t, err)
+	ips, macs, err := util.GetNetInfo()
+	require.NoError(t, err)
+
+	for _, enabled := range []bool{true, false} {
+		name := "network disabled"
+		if enabled {
+			name = "network enabled"
+		}
+		t.Run(name, func(t *testing.T) {
+			cfg, err := common.NewConfigFrom(map[string]interface{}{
+				"netinfo.enabled": enabled,
+			})
+			require.NoError(t, err)
+			p, err := New(cfg)
+			require.NoError(t, err)
+			event, err := p.Run(&beat.Event{Fields: common.MapStr{}})
+			require.NoError(t, err)
+			require.NotNil(t, event)
+
+			for field, expected := range map[string]string{
+				"host.os.name":    osName,
+				"host.os.version": release,
+				"host.os.kernel":  release,
+				"host.os.type":    "unix",
+				"host.hostname":   hostname,
+			} {
+				value, err := event.GetValue(field)
+				require.NoError(t, err, field)
+				assert.Equal(t, expected, value, field)
+			}
+
+			for field, expected := range map[string][]string{
+				"host.ip":  ips,
+				"host.mac": macs,
+			} {
+				value, err := event.GetValue(field)
+				if !enabled || len(expected) == 0 {
+					assert.Error(t, err, field)
+					assert.Nil(t, value, field)
+					continue
+				}
+				require.NoError(t, err, field)
+				actual, ok := value.([]string)
+				require.True(t, ok, field)
+				assert.ElementsMatch(t, expected, actual, field)
+				if field == "host.ip" {
+					for _, ip := range actual {
+						assert.NotContains(t, ip, "/")
+						assert.NotNil(t, net.ParseIP(ip), "address must be an IP, without CIDR notation")
+					}
+				}
+			}
+		})
+	}
+}
