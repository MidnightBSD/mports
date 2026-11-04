--- eng/common/native/init-os-and-arch.sh.orig
+++ eng/common/native/init-os-and-arch.sh
@@ -8,8 +8,8 @@ if command -v getprop && getprop ro.product.system.mod
 fi
 
 case "$OSName" in
-freebsd|linux|netbsd|openbsd|sunos|android|haiku)
-    os="$OSName" ;;
+midnightbsd|freebsd|linux|netbsd|openbsd|sunos|android|haiku)
+    os="$OSName"; [ "$os" = "midnightbsd" ] && os="freebsd" ;;
 darwin)
     os=osx ;;
 *)
