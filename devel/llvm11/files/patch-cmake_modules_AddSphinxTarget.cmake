--- cmake/modules/AddSphinxTarget.cmake.orig	2020-12-18 19:57:38 UTC
+++ cmake/modules/AddSphinxTarget.cmake
@@ -34,6 +34,8 @@ function (add_sphinx_target builder proj
   endif()
 
   add_custom_target(${SPHINX_TARGET_NAME}
+		    COMMAND ${CMAKE_COMMAND}
+                            -E make_directory ${SPHINX_BUILD_DIR}
                     COMMAND ${SPHINX_EXECUTABLE}
                             -b ${builder}
                             -d "${SPHINX_DOC_TREE_DIR}"
