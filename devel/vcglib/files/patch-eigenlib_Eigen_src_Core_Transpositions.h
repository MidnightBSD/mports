--- eigenlib/Eigen/src/Core/Transpositions.h.orig	2020-09-18 11:29:23 UTC
+++ eigenlib/Eigen/src/Core/Transpositions.h
@@ -384,7 +384,7 @@ class Transpose<TranspositionsBase<TranspositionsDeri
     const Product<OtherDerived, Transpose, AliasFreeProduct>
     operator*(const MatrixBase<OtherDerived>& matrix, const Transpose& trt)
     {
-      return Product<OtherDerived, Transpose, AliasFreeProduct>(matrix.derived(), trt.derived());
+      return Product<OtherDerived, Transpose, AliasFreeProduct>(matrix.derived(), trt);
     }
 
     /** \returns the \a matrix with the inverse transpositions applied to the rows.
