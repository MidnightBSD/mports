GHSA-8474-xrp6-wh69: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/210ac22d446c8e2625b091e79256806b836eee20.patch

index 964b7af3c4d5..1046ea04bae8 100644
--- lib/active_support/inflector/methods.rb	2025-10-28 23:24:00 UTC
+++ lib/active_support/inflector/methods.rb
@@ -319,7 +319,8 @@ def safe_constantize(camel_cased_word)
         e.name.to_s == camel_cased_word.to_s)
     rescue LoadError => e
       message = e.respond_to?(:original_message) ? e.original_message : e.message
-      raise unless /Unable to autoload constant #{const_regexp(camel_cased_word)}/.match?(message)
+      constant_name = camel_cased_word.split("::").find { |part| !part.empty? } || camel_cased_word
+      raise unless message.include?("Unable to autoload constant #{constant_name}")
     end

     # Returns the suffix that should be added to a number to denote the position
@@ -349,23 +350,6 @@ def ordinalize(number)
     end

     private
-      # Mounts a regular expression, returned as a string to ease interpolation,
-      # that will match part by part the given constant.
-      #
-      #   const_regexp("Foo::Bar::Baz") # => "Foo(::Bar(::Baz)?)?"
-      #   const_regexp("::")            # => "::"
-      def const_regexp(camel_cased_word)
-        parts = camel_cased_word.split("::")
-
-        return Regexp.escape(camel_cased_word) if parts.empty?
-
-        last = parts.pop
-
-        parts.reverse!.inject(last) do |acc, part|
-          part.empty? ? acc : "#{part}(::#{acc})?"
-        end
-      end
-
       # Applies inflection rules for +singularize+ and +pluralize+.
       #
       # If passed an optional +locale+ parameter, the uncountables will be
