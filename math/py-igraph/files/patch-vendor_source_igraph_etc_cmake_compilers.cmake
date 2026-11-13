--- vendor/source/igraph/etc/cmake/compilers.cmake.orig	2025-10-23 11:39:27 UTC
+++ vendor/source/igraph/etc/cmake/compilers.cmake
@@ -2,8 +1,0 @@
-
-# Enable POSIX features. This needs to be set here instead of in source files so
-# that it affects CMake-based feature tests.
-#
-# See:
-#  - https://pubs.opengroup.org/onlinepubs/007904875/functions/xsh_chap02_02.html
-#  - https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html
-add_compile_definitions(_POSIX_C_SOURCE=200809L)
