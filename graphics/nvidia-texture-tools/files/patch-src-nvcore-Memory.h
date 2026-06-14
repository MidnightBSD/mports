--- src/nvcore/Memory.h.orig	2010-05-15 09:12:05 UTC
+++ src/nvcore/Memory.h
@@ -28,22 +28,22 @@ namespace nv
 
 // Override new/delete
 
-inline void * operator new (size_t size) throw()
+inline void * operator new (size_t size) noexcept(false)
 {
 	return nv::mem::malloc(size); 
 }
 
-inline void operator delete (void *p) throw()
+inline void operator delete (void *p) noexcept
 {
 	nv::mem::free(p); 
 }
 
-inline void * operator new [] (size_t size) throw()
+inline void * operator new [] (size_t size) noexcept(false)
 {
 	return nv::mem::malloc(size);
 }
 
-inline void operator delete [] (void * p) throw()
+inline void operator delete [] (void * p) noexcept
 {
 	nv::mem::free(p); 
 }
