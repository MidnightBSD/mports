--- src/hamcrest/library/collection/issequence_containinginorder.py.orig
+++ src/hamcrest/library/collection/issequence_containinginorder.py
@@ -1,5 +1,5 @@
 import warnings
-from typing import Optional, Sequence, TypeVar, Union
+from typing import Generic, Optional, Sequence, TypeVar, Union
 
 from hamcrest.core.base_matcher import BaseMatcher
 from hamcrest.core.description import Description
@@ -13,7 +13,7 @@
 T = TypeVar("T")
 
 
-class MatchingInOrder(object):
+class MatchingInOrder(Generic[T]):
     def __init__(
         self, matchers: Sequence[Matcher[T]], mismatch_description: Optional[Description]
     ) -> None:
