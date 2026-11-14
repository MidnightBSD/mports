--- requests_cache/serializers/cattrs.py.orig
+++ requests_cache/serializers/cattrs.py
@@ -245,0 +246,20 @@
+def _restore_decimals(value):
+    """Restore DynamoDB numbers in decoded JSON content to JSON-compatible values."""
+
+    def _decimal_to_number(obj):
+        if isinstance(obj, list):
+            return [_decimal_to_number(v) for v in obj]
+        elif isinstance(obj, dict):
+            return {k: _decimal_to_number(v) for k, v in obj.items()}
+        elif isinstance(obj, Decimal):
+            # JSON floats are converted to Decimals before storage; their exponent distinguishes
+            # integral floats (including -0.0) from integers, which must remain exact.
+            return int(obj) if obj.as_tuple().exponent == 0 else float(obj)
+        else:
+            return obj
+
+    if isinstance(value, dict) and '_decoded_content' in value:
+        value['_decoded_content'] = _decimal_to_number(value['_decoded_content'])
+    return value
+
+
--- requests_cache/serializers/preconf.py.orig
+++ requests_cache/serializers/preconf.py
@@ -15 +15,6 @@
-from .cattrs import CattrStage, _convert_floats, make_decimal_timedelta_converter
+from .cattrs import (
+    CattrStage,
+    _convert_floats,
+    _restore_decimals,
+    make_decimal_timedelta_converter,
+)
@@ -171 +176 @@
-convert_float_stage = Stage(dumps=_convert_floats, loads=lambda x: x)
+convert_float_stage = Stage(dumps=_convert_floats, loads=_restore_decimals)
--- tests/unit/test_serializers.py.orig
+++ tests/unit/test_serializers.py
@@ -3,0 +4,2 @@
+import json
+import math
@@ -5,0 +8 @@
+from decimal import Decimal
@@ -23,0 +27 @@
+from requests_cache.serializers.cattrs import _restore_decimals
@@ -151,0 +156,30 @@
+
+
+def test_dynamodb_decoded_json_decimal_roundtrip():
+    value = {
+        '_decoded_content': {
+            'integer': Decimal('9007199254740993'),
+            'integral_float': Decimal('1.0'),
+            'negative_zero': Decimal('-0.0'),
+            'large_float': Decimal('1E+20'),
+            'fraction': Decimal('0.125'),
+            'nested': [Decimal('2.5')],
+        },
+        'unrelated': Decimal('3.5'),
+    }
+
+    result = _restore_decimals(value)
+
+    assert result['_decoded_content'] == {
+        'integer': 9007199254740993,
+        'integral_float': 1.0,
+        'negative_zero': -0.0,
+        'large_float': 1e20,
+        'fraction': 0.125,
+        'nested': [2.5],
+    }
+    assert result['unrelated'] == Decimal('3.5')
+    assert isinstance(result['_decoded_content']['integral_float'], float)
+    assert isinstance(result['_decoded_content']['large_float'], float)
+    assert math.copysign(1.0, result['_decoded_content']['negative_zero']) == -1.0
+    assert json.loads(json.dumps(result['_decoded_content'])) == result['_decoded_content']
