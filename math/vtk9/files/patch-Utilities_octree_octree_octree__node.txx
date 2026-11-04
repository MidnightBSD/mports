Fix a typo in a template member that clang 19 now diagnoses even when
the template is not instantiated. Fixed upstream in VTK 9.3.

--- Utilities/octree/octree/octree_node.txx.orig	2023-05-16 15:04:51 UTC
+++ Utilities/octree/octree/octree_node.txx
@@ -207,7 +207,7 @@ const octree_node<T_, d_, A_>& octree_node<T_, d_, A_>
   {
     throw std::domain_error("Attempt to access children of an octree leaf node.");
   }
-  return this->_M_chilren[child];
+  return this->m_children[child];
 }
 
 /**\brief Return a reference to a child node.
