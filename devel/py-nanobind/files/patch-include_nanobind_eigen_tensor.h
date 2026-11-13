--- include/nanobind/eigen/tensor.h.orig
+++ include/nanobind/eigen/tensor.h
@@ -106,7 +106,7 @@
 
         if (!caster.from_python(src, flags, cleanup))
             return false;
-        if(IsAligned && !is_tensor_aligned(caster.value.data()))
+        if (IsAligned && caster.value.size() != 0 && !is_tensor_aligned(caster.value.data()))
             return false;
 
         return true;
