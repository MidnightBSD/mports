--- compiler-rt/lib/tsan/go/buildgo.sh.orig
+++ compiler-rt/lib/tsan/go/buildgo.sh
@@ -23,7 +23,7 @@
 	elif [ "`uname -a | grep s390x`" != "" ]; then
 		HOST_GOARCH="s390x"
 	fi
-elif [ "`uname -a | grep FreeBSD`" != "" ]; then
+elif [ "`uname -a | grep -E 'FreeBSD|MidnightBSD'`" != "" ]; then
 	HOST_GOOS="freebsd"
 	HOST_GOARCH="amd64"
 elif [ "`uname -a | grep NetBSD`" != "" ]; then
