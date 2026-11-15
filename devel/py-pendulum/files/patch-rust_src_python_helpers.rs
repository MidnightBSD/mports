--- rust/src/python/helpers.rs
+++ rust/src/python/helpers.rs
@@ -100,2 +100,5 @@
     if let Some(tzname_attr) = tzname_attr {
+        if tzname_attr.is_none() {
+            return Ok(String::new());
+        }
         let tzname: &Bound<PyString> = tzname_attr.cast()?;
