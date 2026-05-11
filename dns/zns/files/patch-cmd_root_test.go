--- cmd/root_test.go	2025-09-10 18:00:28 UTC
+++ cmd/root_test.go
@@ -4,8 +4,9 @@ import (
 	"fmt"
 	"log"
 	"net"
 	"os"
 	"testing"
+	"time"
 
 	"github.com/miekg/dns"
 	"github.com/stretchr/testify/assert"
@@ -17,6 +18,7 @@ const (
 
 func TestMain(m *testing.M) {
 	go startDNSServer()
+	waitForDNSServer()
 
 	code := m.Run()
 	os.Exit(code)
@@ -32,6 +34,22 @@ func startDNSServer() {
 	}()
 }
 
+func waitForDNSServer() {
+	client := &dns.Client{Timeout: 50 * time.Millisecond}
+	msg := new(dns.Msg)
+	msg.SetQuestion("example.com.", dns.TypeA)
+	server := fmt.Sprintf("127.0.0.1:%d", DNSServerPort)
+
+	for i := 0; i < 50; i++ {
+		if _, _, err := client.Exchange(msg, server); err == nil {
+			return
+		}
+		time.Sleep(20 * time.Millisecond)
+	}
+
+	log.Fatalf("Timed out waiting for DNS server")
+}
+
 func dnsHandler(w dns.ResponseWriter, r *dns.Msg) {
 	msg := dns.Msg{}
 	msg.SetReply(r)
