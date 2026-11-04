--- clamav-unofficial-sigs.sh.orig
+++ clamav-unofficial-sigs.sh
@@ -1704,55 +1704,21 @@
 enable_log="no"
 custom_config="no"
 we_have_a_config="0"
-
+pkg_mgr="MidnightBSD mports"
+pkg_rm="mport delete clamav-unofficial-sigs"
 
-# Attempt to scan for a valid config dir
-# NOTE: a missing config dir is only fatal after command line parsing,
-# so that -c/--config can still supply a custom config on fresh systems
-if [ -f "/etc/clamav-unofficial-sigs/master.conf" ] ; then
-  config_dir="/etc/clamav-unofficial-sigs"
-elif [ -f "/usr/local/etc/clamav-unofficial-sigs/master.conf" ] ; then
-  config_dir="/usr/local/etc/clamav-unofficial-sigs/"
-elif [ -f "/opt/homebrew/etc/clamav-unofficial-sigs/master.conf" ] ; then
-  # macOS Apple Silicon homebrew
-  config_dir="/opt/homebrew/etc/clamav-unofficial-sigs/"
-elif [ -f "/opt/zimbra/conf/clamav-unofficial-sigs/master.conf" ] ; then
-  config_dir="/opt/zimbra/conf/clamav-unofficial-sigs/"
-else
-  config_dir=""
-fi
 # Default config files
-if [ -n "$config_dir" ] ; then
-  if [ -r "${config_dir}/master.conf" ] ; then
-      config_files+=( "${config_dir}/master.conf" )
-  else
-      xshok_pretty_echo_and_log "ERROR: ${config_dir}/master.conf is not readable"
-      exit 1
-  fi
-  if [ -r "${config_dir}/os.conf" ] ; then
-      config_files+=( "${config_dir}/os.conf" )
-  else
-      #find the a suitable os.*.conf file
-      os_config_number=$(find "$config_dir" -type f -iname "os.*.conf" | wc -l)
-      if [ "$os_config_number" == "0" ] ; then
-          xshok_pretty_echo_and_log "WARNING: no os.conf or os.*.conf found"
-      elif [ "$os_config_number" == "1" ] ; then
-          config_file="$(find "$config_dir" -type f -iname "os.*.conf" | head -n1)"
-          if [ -r "${config_file}" ]; then
-              config_files+=( "${config_file}" )
-          else
-              xshok_pretty_echo_and_log "WARNING: ${config_file} is not readable"
-          fi
-      else
-          xshok_pretty_echo_and_log "WARNING: Too many os.*.conf configs found"
-      fi
-  fi
-  if [ -r "${config_dir}/user.conf" ] ; then
-      config_files+=( "${config_dir}/user.conf" )
-  else
-      xshok_pretty_echo_and_log "WARNING: ${config_dir}/user.conf is not readable"
-  fi
+config_dir="%%PREFIX%%/etc/clamav-unofficial-sigs"
+config_files=()
+if [ -r "${config_dir}/master.conf" ] ; then
+    config_files+=( "${config_dir}/master.conf" )
 fi
+if [ -r "${config_dir}/os.conf" ] ; then
+    config_files+=( "${config_dir}/os.conf" )
+fi
+if [ -r "${config_dir}/user.conf" ] ; then
+    config_files+=( "${config_dir}/user.conf" )
+fi
 
 # Solaris command -v function returns garbage when the program is not found k
 # only define the new command -v function if running under Solaris
@@ -1767,7 +1733,7 @@
 # sed_bin, this is required to be known upfront, due to how the configs are read.
 if [ -z "$sed_bin" ] ; then
     # Detect support for sed or gsed
-    if [ "$(uname -s)" == "Darwin" ] || [ "$(uname -s)" == "OpenBSD" ] || [ "$(uname -s)" == "NetBSD" ] || [ "$(uname -s)" == "FreeBSD" ] ; then
+    if [ "$(uname -s)" == "Darwin" ] || [ "$(uname -s)" == "OpenBSD" ] || [ "$(uname -s)" == "NetBSD" ] || [ "$(uname -s)" == "FreeBSD" ] || [ "$(uname -s)" == "MidnightBSD" ] ; then
         sed_bin="$(command -v gsed 2> /dev/null)"
         if [ -z "$sed_bin" ]; then
             xshok_pretty_echo_and_log "ERROR: gsed (gnu sed) is missing"
@@ -1878,10 +1844,8 @@
         else
             xshok_pretty_echo_and_log "WARNING: ${config_dir}/master.conf not found"
         fi
-        #find the a suitable os.conf or os.*.conf file
-        config_file="$(find "$config_dir" -type f -iname "os.conf" -o -iname "os.*.conf" | tail -n1)"
-        if [ -r "${config_file}" ] ; then
-            config_files+=( "${config_file}" )
+        if [ -r "${config_dir}/os.conf" ] ; then
+            config_files+=( "${config_dir}/os.conf" )
         else
             xshok_pretty_echo_and_log "WARNING: ${config_dir}/os.conf not found"
         fi
@@ -1909,7 +1873,7 @@
     # Config stripping
     xshok_pretty_echo_and_log "Loading config: ${config_file}"
 
-    if [ "$uname_s" == "SunOS" ] || [ "$uname_s" == "Darwin" ] || [ "$uname_s" == "OpenBSD" ] || [ "$uname_s" == "NetBSD" ] || [ "$uname_s" == "FreeBSD" ] ; then
+    if [ "$uname_s" == "SunOS" ] || [ "$uname_s" == "Darwin" ] || [ "$uname_s" == "OpenBSD" ] || [ "$uname_s" == "NetBSD" ] || [ "$uname_s" == "FreeBSD" ] || [ "$uname_s" == "MidnightBSD" ] ; then
       # Solaris / macOS / OSX / BSD fixes, had issues with running with a single command..
       # NOTE: never pipe the config through xargs here, it strips the quotes and
       # breaks multi-word values such as clamd_reload_opt="clamdscan --reload"
