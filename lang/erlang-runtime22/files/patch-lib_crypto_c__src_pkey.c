--- lib/crypto/c_src/pkey.c.orig	2020-06-12 20:11:15 UTC
+++ lib/crypto/c_src/pkey.c
@@ -76,1 +76,1 @@
-        if (!FIPS_mode()) return PKEY_OK;
+        if (!EVP_default_properties_is_fips_enabled(NULL)) return PKEY_OK;
@@ -322,1 +322,1 @@
-        if (!FIPS_mode())
+        if (!EVP_default_properties_is_fips_enabled(NULL))
@@ -452,1 +452,1 @@
-        if (!FIPS_mode()) {
+        if (!EVP_default_properties_is_fips_enabled(NULL)) {
@@ -609,1 +609,1 @@
-        if (!FIPS_mode()) {
+        if (!EVP_default_properties_is_fips_enabled(NULL)) {
@@ -842,1 +842,1 @@
-        if (!FIPS_mode()) {
+        if (!EVP_default_properties_is_fips_enabled(NULL)) {
