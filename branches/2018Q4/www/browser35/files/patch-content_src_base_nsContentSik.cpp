--- content/base/src/nsContentSink.cpp.orig	2011-06-11 21:34:49 -0400
+++ content/base/src/nsContentSink.cpp	2011-06-11 21:35:48 -0400
@@ -1857,7 +1857,9 @@
   &nsGkAtoms::output,
   &nsGkAtoms::p,
   &nsGkAtoms::pre,
+#ifdef MOZ_MEDIA
   &nsGkAtoms::progress,
+#endif
   &nsGkAtoms::q,
   &nsGkAtoms::rp,
   &nsGkAtoms::rt,
@@ -1949,7 +1951,9 @@
   &nsGkAtoms::lang,
   &nsGkAtoms::list,
   &nsGkAtoms::longdesc,
+#ifdef MOZ_MEDIA
   &nsGkAtoms::loop,
+#endif
   &nsGkAtoms::low,
   &nsGkAtoms::max,
   &nsGkAtoms::maxlength,
