GHSA-5957-c7qm-m469: upstream Rails security fix backported to Rails 7.2.3.
Source: https://github.com/rails/rails/commit/4aa2ec66822bc4eb8b341a0608f1c90a3e371a34.patch

index c14e5334755e8..05eb5b0d356b6 100644
--- app/controllers/action_mailbox/ingresses/mailgun/inbound_emails_controller.rb	2025-10-28 23:24:00 UTC
+++ app/controllers/action_mailbox/ingresses/mailgun/inbound_emails_controller.rb
@@ -99,7 +99,7 @@ def signed?

           # Allow for 2 minutes of drift between Mailgun time and local server time.
           def recent?
-            Time.at(timestamp) >= 2.minutes.ago
+            Time.at(timestamp).between?(2.minutes.ago, 2.minutes.from_now)
           end

           def expected_signature
