Original Python 3 compatibility changes obtained from:
https://bitbucket.org/tkoskine/sphinxcontrib-adadomain/commits/0adaafc635791511af623027bd2cf57375763a27
Additional Sphinx API and Ada qualification fixes are local.

--- sphinxcontrib/adadomain.py.orig	2018-01-19 17:53:22 UTC
+++ sphinxcontrib/adadomain.py
@@ -18,13 +18,14 @@

 from docutils import nodes
 from docutils.parsers.rst import directives
-
-from sphinx import addnodes
+from docutils.parsers.rst import Directive
+
+from sphinx import addnodes, version_info
 from sphinx.roles import XRefRole
-from sphinx.locale import l_, _
+from sphinx.locale import _
+l_ = _
 from sphinx.directives import ObjectDescription
 from sphinx.domains import Domain, ObjType, Index
-from sphinx.util.compat import Directive
 from sphinx.util.nodes import make_refnode
 from sphinx.util.docfields import Field, TypedField

@@ -113,8 +114,8 @@

         stack = [signode[-1]]
         counters = [0, 0]
-        for token in string.split(arglist, ';'):
-            pieces = string.split(token, ':')
+        for token in arglist.split(';'):
+            pieces = token.split(':')
             name = pieces[0].strip()
             stack[-1] += addnodes.desc_parameter(name, name + " : " + pieces[1].strip())

@@ -159,8 +160,8 @@

         stack = [signode[-1]]
         counters = [0, 0]
-        for token in string.split(arglist, ';'):
-            pieces = string.split(token, ':')
+        for token in arglist.split(';'):
+            pieces = token.split(':')
             name = pieces[0].strip()
             stack[-1] += addnodes.desc_parameter(name, name + " : " + pieces[1].strip())
             if len(stack) == 1:
@@ -215,7 +216,7 @@


     def add_target_and_index(self, name, sig, signode):
-        pieces = string.split(name, '.')
+        pieces = name.split('.')
         if name not in self.state.document.ids:
             signode['names'].append(name)
             signode['ids'].append(name)
@@ -269,12 +270,12 @@

         indextext = self._get_index_text(name)
         if indextext:
-            self.indexnode['entries'].append(('single', indextext, name, name))
+            self.indexnode['entries'].append(('single', indextext, name, name, None))

         plain_name = pieces[-1]
         indextext = self._get_index_text(plain_name)
         if indextext:
-            self.indexnode['entries'].append(('single', indextext, name, plain_name))
+            self.indexnode['entries'].append(('single', indextext, name, plain_name, None))


 class AdaModule(Directive):
@@ -316,7 +317,7 @@
         if not noindex:
             indextext = _('%s (module)') % modname
             inode = addnodes.index(entries=[('single', indextext,
-                                             'module-' + modname, modname)])
+                                             'module-' + modname, modname, None)])
             ret.append(inode)
         return ret

@@ -490,8 +491,8 @@
         """
         if not name:
             return None, None
-        if ":" not in name:
-            name = "%s:%s" % (modname, name)
+        if '.' not in name:
+            name = '%s.%s' % (modname or 'ada', name)

         if name in self.data['objects']:
             return name, self.data['objects'][name][0]
