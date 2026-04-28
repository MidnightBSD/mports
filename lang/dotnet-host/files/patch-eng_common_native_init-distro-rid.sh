--- eng/common/native/init-distro-rid.sh.orig
+++ eng/common/native/init-distro-rid.sh
@@ -35,7 +35,11 @@
 
     if [ "$targetOs" = "freebsd" ]; then
         # $rootfsDir can be empty. freebsd-version is a shell script and should always work.
-        __freebsd_major_version=$("$rootfsDir"/bin/freebsd-version | cut -d'.' -f1)
+        if [ -x "$rootfsDir/bin/freebsd-version" ]; then
+            __freebsd_major_version=$("$rootfsDir"/bin/freebsd-version | cut -d'.' -f1)
+        else
+            __freebsd_major_version=$(uname -r | cut -d'.' -f1)
+        fi
         nonPortableRid="freebsd.$__freebsd_major_version-${targetArch}"
     elif command -v getprop >/dev/null && getprop ro.product.system.model | grep -qi android; then
         __android_sdk_version=$(getprop ro.build.version.sdk)
