--- vendor/golang.org/x/net/internal/socket/rawconn_msg.go.orig	2022-04-25 22:30:48 UTC
+++ vendor/golang.org/x/net/internal/socket/rawconn_msg.go
@@ -8,22 +8,21 @@
 package socket
 
 import (
+	"net"
 	"os"
 )
 
 func (c *Conn) recvMsg(m *Message, flags int) error {
 	m.raceWrite()
-	var h msghdr
-	vs := make([]iovec, len(m.Buffers))
-	var sa []byte
-	if c.network != "tcp" {
-		sa = make([]byte, sizeofSockaddrInet6)
-	}
-	h.pack(vs, m.Buffers, m.OOB, sa)
-	var operr error
-	var n int
+	var (
+		operr     error
+		n         int
+		oobn      int
+		recvflags int
+		from      net.Addr
+	)
 	fn := func(s uintptr) bool {
-		n, operr = recvmsg(s, &h, flags)
+		n, oobn, recvflags, from, operr = recvmsg(s, m.Buffers, m.OOB, flags, c.network)
 		return ioComplete(flags, operr)
 	}
 	if err := c.c.Read(fn); err != nil {
@@ -32,34 +31,21 @@ func (c *Conn) recvMsg(m *Message, flags int) error {
 	if operr != nil {
 		return os.NewSyscallError("recvmsg", operr)
 	}
-	if c.network != "tcp" {
-		var err error
-		m.Addr, err = parseInetAddr(sa[:], c.network)
-		if err != nil {
-			return err
-		}
-	}
+	m.Addr = from
 	m.N = n
-	m.NN = h.controllen()
-	m.Flags = h.flags()
+	m.NN = oobn
+	m.Flags = recvflags
 	return nil
 }
 
 func (c *Conn) sendMsg(m *Message, flags int) error {
 	m.raceRead()
-	var h msghdr
-	vs := make([]iovec, len(m.Buffers))
-	var sa []byte
-	if m.Addr != nil {
-		var a [sizeofSockaddrInet6]byte
-		n := marshalInetAddr(m.Addr, a[:])
-		sa = a[:n]
-	}
-	h.pack(vs, m.Buffers, m.OOB, sa)
-	var operr error
-	var n int
+	var (
+		operr error
+		n     int
+	)
 	fn := func(s uintptr) bool {
-		n, operr = sendmsg(s, &h, flags)
+		n, operr = sendmsg(s, m.Buffers, m.OOB, m.Addr, flags)
 		return ioComplete(flags, operr)
 	}
 	if err := c.c.Write(fn); err != nil {
