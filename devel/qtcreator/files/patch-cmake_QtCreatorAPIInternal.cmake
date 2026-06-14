--- cmake/QtCreatorAPIInternal.cmake.orig	2026-05-30 09:00:28.890205000 -0400
+++ cmake/QtCreatorAPIInternal.cmake	2026-05-30 09:00:36.183655000 -0400
@@ -224,7 +224,7 @@
     set(file_dependencies DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/${target_name}.json")
   endif()
   set_property(SOURCE "${file}" PROPERTY SKIP_AUTOMOC ON)
-  qt_wrap_cpp(file_moc "${file}" ${file_dependencies})
+  qt_wrap_cpp(file_moc "${file}" TARGET ${target_name} ${file_dependencies})
   target_sources(${target_name} PRIVATE "${file_moc}")
 endfunction()
 
