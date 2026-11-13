--- tests/unit/type/string.tcl.orig
+++ tests/unit/type/string.tcl
@@ -749,6 +749,34 @@
         r set foo bar px 10000
         set ttl [r ttl foo]
         assert {$ttl <= 10 && $ttl > 5}
+    }
+
+    test {Relative string expiration overflow must not modify keys} {
+        foreach {option expiry} {PX 9223372036854775806 PX 9223372036854775807 EX 9223372036854775} {
+            set commands [list \
+                [list set overflow:key new $option $expiry] \
+                [list getex overflow:key $option $expiry] \
+                [list msetex 1 overflow:key new $option $expiry]]
+            if {$option eq "PX"} {
+                lappend commands [list psetex overflow:key $expiry new]
+            } else {
+                lappend commands [list setex overflow:key $expiry new]
+            }
+            foreach command $commands {
+                r set overflow:key old
+                assert_error {ERR invalid expire time*} {r {*}$command}
+                assert_equal old [r get overflow:key]
+                assert_equal -1 [r pttl overflow:key]
+            }
+        }
+        r del overflow:key
+    }
+
+    test {Absolute string expiration near LLONG_MAX remains valid} {
+        r set overflow:absolute valid PXAT 9223372036854775807
+        assert_equal valid [r get overflow:absolute]
+        assert_morethan [r pttl overflow:absolute] 0
+        r del overflow:absolute
     }
 
     test "Extended SET EXAT option" {
