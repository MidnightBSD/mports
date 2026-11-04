--- src/prediction/gen_zero_query_data.py.orig	2026-07-17 00:00:00 UTC
+++ src/prediction/gen_zero_query_data.py
@@ -72,5 +72,5 @@ def RemoveTrailingNumber(string):
   if not string:
     return b''
-  return re.sub(br'^([^0-9]+)[0-9]+$', r'\1', string)
+  return re.sub(br'^([^0-9]+)[0-9]+$', rb'\1', string)
