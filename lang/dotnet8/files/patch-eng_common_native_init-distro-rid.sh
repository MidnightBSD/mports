--- eng/common/native/init-distro-rid.sh.orig
+++ eng/common/native/init-distro-rid.sh
@@ -34,8 +34,13 @@ getNonPortableDistroRid()
     fi
 
     if [ "$targetOs" = "freebsd" ]; then
-        # $rootfsDir can be empty. freebsd-version is shell script and it should always work.
-        __freebsd_major_version=$($rootfsDir/bin/freebsd-version | { read v; echo "${v%%.*}"; })
+        if [ -x "$rootfsDir/bin/freebsd-version" ]; then
+            __freebsd_major_version=$($rootfsDir/bin/freebsd-version | { read v; echo "${v%%.*}"; })
+        elif [ -x "$rootfsDir/bin/midnightbsd-version" ]; then
+            __freebsd_major_version=$($rootfsDir/bin/midnightbsd-version | { read v; echo "${v%%.*}"; })
+        else
+            __freebsd_major_version=$(uname -r | { read v; echo "${v%%.*}"; })
+        fi
         nonPortableRid="freebsd.$__freebsd_major_version-${targetArch}"
     elif command -v getprop && getprop ro.product.system.model 2>&1 | grep -qi android; then
         __android_sdk_version=$(getprop ro.build.version.sdk)
