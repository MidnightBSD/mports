--- src/hamcrest/library/collection/issequence_containinginanyorder.py.orig
+++ src/hamcrest/library/collection/issequence_containinginanyorder.py
@@ -1,4 +1,4 @@
-from typing import MutableSequence, Optional, Sequence, TypeVar, Union, cast
+from typing import Generic, MutableSequence, Optional, Sequence, TypeVar, Union, cast
 
 from hamcrest.core.base_matcher import BaseMatcher
 from hamcrest.core.description import Description
@@ -12,7 +12,7 @@
 T = TypeVar("T")
 
 
-class MatchInAnyOrder(object):
+class MatchInAnyOrder(Generic[T]):
     def __init__(
         self, matchers: Sequence[Matcher[T]], mismatch_description: Optional[Description]
     ) -> None:
