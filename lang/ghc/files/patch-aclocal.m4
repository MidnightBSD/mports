--- aclocal.m4.orig	2020-09-23 13:51:32.845928000 -0400
+++ aclocal.m4	2020-09-23 13:53:12.728105000 -0400
@@ -263,7 +263,7 @@
         mingw32)
             test -z "[$]2" || eval "[$]2=OSMinGW32"
             ;;
-        freebsd)
+        midnightbsd|freebsd)
             test -z "[$]2" || eval "[$]2=OSFreeBSD"
             ;;
         dragonfly)
@@ -668,7 +668,7 @@
     i386-unknown-mingw32)
         $2="$$2 -march=i686"
         ;;
-    i386-portbld-freebsd*)
+    i386-portbld-freebsd* | i386-portbld-midnightbsd*)
         $2="$$2 -march=i686"
         ;;
     x86_64-unknown-solaris2)
@@ -693,7 +693,7 @@
         $5="$$5 -D_HPUX_SOURCE"
         ;;
 
-    arm*freebsd*)
+    arm*freebsd*|arm*midnightbsd*)
         # On arm/freebsd, tell gcc to generate Arm
         # instructions (ie not Thumb).
         $2="$$2 -marm"
@@ -708,7 +708,7 @@
         $4="$$4 -z noexecstack"
         ;;
 
-    aarch64*freebsd*)
+    aarch64*freebsd*|aarch64*midnightbsd*)
         $3="$$3 -Wl,-z,noexecstack"
         $4="$$4 -z noexecstack"
         ;;
@@ -2006,7 +2006,7 @@
 # converts the canonicalized target into someting llvm can understand
 AC_DEFUN([GHC_LLVM_TARGET], [
   case "$2-$3" in
-    *-freebsd*-gnueabihf)
+    *-freebsd*-gnueabihf|*-midnightbsd*-gnuabihf)
       llvm_target_vendor="unknown"
       llvm_target_os="freebsd-gnueabihf"
       ;;
@@ -2078,7 +2078,7 @@
         $3="openbsd"
         ;;
       # As far as I'm aware, none of these have relevant variants
-      freebsd|netbsd|dragonfly|hpux|linuxaout|kfreebsdgnu|freebsd2|mingw32|darwin|nextstep2|nextstep3|sunos4|ultrix|haiku)
+      midnightbsd|freebsd|netbsd|dragonfly|hpux|linuxaout|kfreebsdgnu|freebsd2|mingw32|darwin|nextstep2|nextstep3|sunos4|ultrix|haiku)
         $3="$1"
         ;;
       msys)
@@ -2093,7 +2093,7 @@
       solaris2*)
         $3="solaris2"
         ;;
-      freebsd*) # like i686-gentoo-freebsd7
+      midnightbsd*|freebsd*) # like i686-gentoo-freebsd7
                 #      i686-gentoo-freebsd8
                 #      i686-gentoo-freebsd8.2
         $3="freebsd"
