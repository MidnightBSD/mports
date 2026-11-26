-- Relax the setuptools lower bound in the wheel's runtime metadata. The source build
-- uses the private setuptools 78 provider for PEP 639 license metadata validation;
-- the installed package uses the shared setuptools port, which is older. This avoids
-- advertising a runtime floor that is only needed by the build backend.
-- PyTorch now builds via scikit-build-core and setup.py is a pip-forwarding shim, so
-- the dependency list that used to be patched there now lives in this module.
-- See https://github.com/pytorch/pytorch/issues/152276 for the build-system migration.
--- tools/metadata/dependencies.py.orig	2026-10-28 18:16:03 UTC
+++ tools/metadata/dependencies.py
@@ -29,7 +29,7 @@ BASE_DEPENDENCIES = [
 BASE_DEPENDENCIES = [
     "filelock",
     "typing-extensions>=4.13.0",
-    "setuptools>=77.0.3",
+    "setuptools",
     "sympy>=1.13.3",
     "networkx>=2.5.1",
     "jinja2",
