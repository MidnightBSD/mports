From 42c976b55503732e096ab30436ec601dd732032b Mon Sep 17 00:00:00 2001
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Date: Sun, 20 Dec 2020 13:38:53 -0800
Subject: [PATCH 1/2] linkers: add rpath_dirs_to_remove support to
 SolarisDynamicLinker

Applies the changes made to GnuLikeDynamicLinkerMixin by
commit d7235c5905fa98207d90f3ad34bf590493498d5b to SolarisDynamicLinker

This makes test_build_rpath pass with the Solaris linker, where before
this change it failed with:

New rpath must not be longer than the old one.
 Old: $ORIGIN/sub:/foo/bar
 New: /baz:$ORIGIN/sub:/foo/bar
FAILED: meson-install

Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
---
 mesonbuild/linkers.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mesonbuild/linkers.py b/mesonbuild/linkers.py
index e74457b08f..0f05fefe8b 100644
--- mesonbuild/linkers.py.orig
+++ mesonbuild/linkers.py
@@ -1260,8 +1260,13 @@ def build_rpath_args(self, env: 'Environment', build_dir: str, from_dir: str,
             return ([], set())
         processed_rpaths = prepare_rpaths(rpath_paths, build_dir, from_dir)
         all_paths = mesonlib.OrderedSet([os.path.join('$ORIGIN', p) for p in processed_rpaths])
+        rpath_dirs_to_remove = set()
+        for p in all_paths:
+            rpath_dirs_to_remove.add(p.encode('utf8'))
         if build_rpath != '':
             all_paths.add(build_rpath)
+            for p in build_rpath.split(':'):
+                rpath_dirs_to_remove.add(p.encode('utf8'))
 
         # In order to avoid relinking for RPATH removal, the binary needs to contain just
         # enough space in the ELF header to hold the final installation RPATH.
@@ -1272,7 +1277,7 @@ def build_rpath_args(self, env: 'Environment', build_dir: str, from_dir: str,
                 paths = padding
             else:
                 paths = paths + ':' + padding
-        return (self._apply_prefix('-rpath,{}'.format(paths)), set())
+        return (self._apply_prefix('-rpath,{}'.format(paths)), rpath_dirs_to_remove)
 
     def get_soname_args(self, env: 'Environment', prefix: str, shlib_name: str,
                         suffix: str, soversion: str, darwin_versions: T.Tuple[str, str],

From 807f3f2f7030ac2fda36a5d95f77a2d61370453d Mon Sep 17 00:00:00 2001
From: Alan Coopersmith <alan.coopersmith@oracle.com>
Date: Mon, 21 Dec 2020 11:39:51 -0800
Subject: [PATCH 2/2] depfixer: split new rpath into multiple entries for dedup
 comparisons

Fixes: #8115

Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
---
 mesonbuild/scripts/depfixer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesonbuild/scripts/depfixer.py b/mesonbuild/scripts/depfixer.py
index 18d70cca96..e31f87db2c 100644
--- mesonbuild/scripts/depfixer.py.orig
+++ mesonbuild/scripts/depfixer.py
@@ -313,7 +313,7 @@ def fix_rpathtype_entry(self, rpath_dirs_to_remove: T.List[bytes], new_rpath: by
         # Only add each one once.
         new_rpaths = OrderedSet()  # type: OrderedSet[bytes]
         if new_rpath:
-            new_rpaths.add(new_rpath)
+            new_rpaths.update(new_rpath.split(b':'))
         if old_rpath:
             # Filter out build-only rpath entries
             # added by get_link_dep_subdirs() or
