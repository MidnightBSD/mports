GHSA-v6rj-xm57-3p59
Security backport preserving the existing Rails series.
Upstream: https://github.com/rails/rails/commit/c796f6198837479ada13290eb8fa767b5219a58a

--- lib/action_view/helpers/text_helper.rb.orig
+++ lib/action_view/helpers/text_helper.rb
@@ -143,8 +143,15 @@
       #
       # [+:highlighter+]
       #   The highlighter string. Uses <tt>\1</tt> as the placeholder for a
-      #   phrase, similar to +String#sub+. Defaults to <tt>"<mark>\1</mark>"</tt>.
-      #   This option is ignored if a block is specified.
+      #   phrase. Defaults to <tt>"<mark>\1</mark>"</tt>. The numbered placeholders
+      #   <tt>\0</tt> to <tt>\9</tt> are expanded; other +String#sub+ replacement escapes
+      #   are not. The phrase is HTML escaped, quotes included. This option
+      #   is ignored if a block is specified.
+      #
+      #   WARNING: Put a placeholder only in element content or inside a
+      #   quoted attribute value. HTML escaping does not make the phrase safe
+      #   in an unquoted attribute value, in a URL, JavaScript or CSS
+      #   context, or in an attribute whose value is HTML, such as +srcdoc+.
       #
       # [+:sanitize+]
       #   Whether to sanitize +text+ before highlighting. Defaults to true.
@@ -163,8 +170,8 @@
       #   highlight('You searched for: rails', ['for', 'rails'], highlighter: '<em>\1</em>')
       #   # => "You searched <em>for</em>: <em>rails</em>"
       #
-      #   highlight('You searched for: rails', 'rails', highlighter: '<a href="search?q=\1">\1</a>')
-      #   # => "You searched for: <a href=\"search?q=rails\">rails</a>"
+      #   highlight('You searched for: rails', 'rails', highlighter: '<mark title="\1">\1</mark>')
+      #   # => "You searched for: <mark title=\"rails\">rails</mark>"
       #
       #   highlight('You searched for: rails', 'rails') { |match| link_to(search_path(q: match)) }
       #   # => "You searched for: <a href=\"search?q=rails\">rails</a>"
@@ -179,14 +186,23 @@
         else
           patterns = Array(phrases).map { |phrase| Regexp === phrase ? phrase : Regexp.escape(phrase) }
           pattern = /(#{patterns.join("|")})/i
+          # The text after a tag begins with the ">" that closes it. Leave it
+          # in the segment so phrases can see it as context, but keep it out
+          # of the match so the highlighter can't take the place of the ">".
+          pattern_after_tag = /(?!\A)#{pattern}/
           highlighter = options.fetch(:highlighter, '<mark>\1</mark>') unless block

-          text.scan(/<[^>]*|[^<]+/).each do |segment|
+          text.scan(/<[^>]*|[^<]+/).each_with_index do |segment, index|
             if !segment.start_with?("<")
+              segment_pattern = index > 0 ? pattern_after_tag : pattern
+
               if block
-                segment.gsub!(pattern, &block)
+                segment.gsub!(segment_pattern, &block)
               else
-                segment.gsub!(pattern, highlighter)
+                segment.gsub!(segment_pattern) do
+                  match = Regexp.last_match
+                  highlighter.gsub(/\\(\d)/) { ERB::Util.html_escape_once(match[$1.to_i]) }
+                end
               end
             end
           end.join
