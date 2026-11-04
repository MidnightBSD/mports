GHSA-8474-xrp6-wh69
Security backport preserving the existing Rails series.
Upstream: https://github.com/rails/rails/commit/210ac22d446c8e2625b091e79256806b836eee20

--- lib/active_support/inflector/methods.rb.orig
+++ lib/active_support/inflector/methods.rb
@@ -307,7 +307,8 @@
         e.name.to_s == camel_cased_word.to_s)
     rescue LoadError => e
       message = e.respond_to?(:original_message) ? e.original_message : e.message
-      raise unless /Unable to autoload constant #{const_regexp(camel_cased_word)}/.match?(message)
+      constant_name = camel_cased_word.split("::").find { |part| !part.empty? } || camel_cased_word
+      raise unless message.include?("Unable to autoload constant #{constant_name}")
     end

     # Returns the suffix that should be added to a number to denote the position
