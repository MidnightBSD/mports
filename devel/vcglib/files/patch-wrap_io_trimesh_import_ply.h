--- wrap/io_trimesh/import_ply.h.orig	2020-09-18 11:29:23 UTC
+++ wrap/io_trimesh/import_ply.h
@@ -29,6 +29,7 @@
 #include<wrap/io_trimesh/io_mask.h>
 #include<wrap/io_trimesh/io_ply.h>
 #include<vcg/complex/algorithms/create/platonic.h>
+#include<vcg/math/shot.h>
 
 namespace vcg {
 namespace tri {
@@ -68,6 +69,9 @@ class ImporterPLY
 	typedef typename OpenMeshType::FaceIterator FaceIterator;
 	typedef typename OpenMeshType::EdgeIterator EdgeIterator;
 
+	PlyInfo pi;
+	vcg::Shot<ScalarType> camera;
+
 #define MAX_USER_DATA 256
 	// Auxiliary structure for reading ply files
 	template<class S>
@@ -1113,30 +1117,33 @@ class ImporterPLY
 						this->pi.status = PlyInfo::E_SHORTFILE;
 						return this->pi.status;
 					}
-					this->camera.valid     = true;
-					this->camera.view_p[0] = ca.view_px;
-					this->camera.view_p[1] = ca.view_py;
-					this->camera.view_p[2] = ca.view_pz;
-					this->camera.x_axis[0] = ca.x_axisx;
-					this->camera.x_axis[1] = ca.x_axisy;
-					this->camera.x_axis[2] = ca.x_axisz;
-					this->camera.y_axis[0] = ca.y_axisx;
-					this->camera.y_axis[1] = ca.y_axisy;
-					this->camera.y_axis[2] = ca.y_axisz;
-					this->camera.z_axis[0] = ca.z_axisx;
-					this->camera.z_axis[1] = ca.z_axisy;
-					this->camera.z_axis[2] = ca.z_axisz;
-					this->camera.f         = ca.focal;
-					this->camera.s[0]      = ca.scalex;
-					this->camera.s[1]      = ca.scaley;
-					this->camera.c[0]      = ca.centerx;
-					this->camera.c[1]      = ca.centery;
-					this->camera.viewport[0] = ca.viewportx;
-					this->camera.viewport[1] = ca.viewporty;
-					this->camera.k[0]      = ca.k1;
-					this->camera.k[1]      = ca.k2;
-					this->camera.k[2]      = ca.k3;
-					this->camera.k[3]      = ca.k4;
+					this->camera.Extrinsics.SetIdentity();
+					this->camera.Extrinsics.SetTra(Point3<ScalarType>( ca.view_px,ca.view_py,ca.view_pz));
+
+					Matrix44<ScalarType> rm;
+					rm.SetIdentity();
+					rm[0][0] = ca.x_axisx;
+					rm[0][1] = ca.x_axisy;
+					rm[0][2] = ca.x_axisz;
+					rm[1][0] = ca.y_axisx;
+					rm[1][1] = ca.y_axisy;
+					rm[1][2] = ca.y_axisz;
+					rm[2][0] = ca.z_axisx;
+					rm[2][1] = ca.z_axisy;
+					rm[2][2] = ca.z_axisz;
+
+					this->camera.Extrinsics.SetRot(rm);
+					this->camera.Intrinsics.FocalMm        = ca.focal;
+					this->camera.Intrinsics.PixelSizeMm[0] = ca.scalex;
+					this->camera.Intrinsics.PixelSizeMm[1] = ca.scaley;
+					this->camera.Intrinsics.CenterPx[0]    = ca.centerx;
+					this->camera.Intrinsics.CenterPx[1]    = ca.centery;
+					this->camera.Intrinsics.ViewportPx[0]  = ca.viewportx;
+					this->camera.Intrinsics.ViewportPx[1]  = ca.viewporty;
+					this->camera.Intrinsics.k[0]           = ca.k1;
+					this->camera.Intrinsics.k[1]           = ca.k2;
+					this->camera.Intrinsics.k[2]           = ca.k3;
+					this->camera.Intrinsics.k[3]           = ca.k4;
 				}
 				break;
 			}
