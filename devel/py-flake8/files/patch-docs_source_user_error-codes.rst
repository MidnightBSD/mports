--- docs/source/user/error-codes.rst.orig
+++ docs/source/user/error-codes.rst
@@ -89,6 +89,10 @@ generates its own :term:`error code`\ s for ``pyflakes``:
 +------+---------------------------------------------------------------------+
 | F707 | an ``except:`` block as not the last exception handler              |
 +------+---------------------------------------------------------------------+
+| F708 | ``lazy`` import must be at module scope                             |
++------+---------------------------------------------------------------------+
+| F709 | ``lazy from ... import *`` is not allowed                           |
++------+---------------------------------------------------------------------+
 | F721 | syntax error in doctest                                             |
 +------+---------------------------------------------------------------------+
 | F722 | syntax error in forward annotation                                  |
@@ -111,6 +115,8 @@ generates its own :term:`error code`\ s for ``pyflakes``:
 +------+---------------------------------------------------------------------+
 | F842 | local variable ``name`` is annotated but never used                 |
 +------+---------------------------------------------------------------------+
+| F851 | eager use of lazily imported ``name`` from line ``N``               |
++------+---------------------------------------------------------------------+
 +------+---------------------------------------------------------------------+
 | F901 | ``raise NotImplemented`` should be ``raise NotImplementedError``    |
 +------+---------------------------------------------------------------------+
