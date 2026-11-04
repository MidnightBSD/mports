--- lib/currency-provider.vala.orig	2025-05-26 18:15:19 UTC
+++ lib/currency-provider.vala
@@ -144,6 +144,7 @@ public abstract class AbstractCurrencyProvider : Object {
             var session = build_session ();
             var message = new Soup.Message ("GET", uri);
             var output = dest.replace (null, false, FileCreateFlags.REPLACE_DESTINATION);
-            session.send_and_splice (message, output,
+            var input = session.send (message, new GLib.Cancellable ());
+            output.splice (input,
                 OutputStreamSpliceFlags.CLOSE_SOURCE | OutputStreamSpliceFlags.CLOSE_TARGET,
                 new GLib.Cancellable ());
@@ -170,6 +171,7 @@ public abstract class AbstractCurrencyProvider : Object {
             var session = build_session ();
             var message = new Soup.Message ("GET", uri);
             var output = yield dest.replace_async (null, false, FileCreateFlags.REPLACE_DESTINATION, Priority.DEFAULT);
-            yield session.send_and_splice_async (message, output,
+            var input = yield session.send_async (message, Priority.DEFAULT, new GLib.Cancellable ());
+            yield output.splice_async (input,
                                                  OutputStreamSpliceFlags.CLOSE_SOURCE | OutputStreamSpliceFlags.CLOSE_TARGET,
                                                  Priority.DEFAULT, new GLib.Cancellable ());
