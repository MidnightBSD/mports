--- include/gmm/gmm_solver_Schwarz_additive.h.orig	2020-05-27 15:56:46 UTC
+++ include/gmm/gmm_solver_Schwarz_additive.h
@@ -574,8 +574,10 @@ namespace gmm {
 #if defined(GMM_USES_SUPERLU)
       double rcond;
       gmm::SuperLU_solve(M.vMloc[i], x, w, rcond);
-#else
+#elif defined(GMM_USES_MUMPS)
       gmm::MUMPS_solve(M.vMloc[i], x, w);
+#else
+      gmm::lu_solve(M.vMloc[i], x, w);
 #endif
       // gmm::iteration iter(1E-10, 0, 100000);
       //gmm::gmres(M.vMloc[i], x, w, gmm::identity_matrix(), 50, iter);
