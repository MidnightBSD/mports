--- test/test_hypothesis/conftest.py.orig
+++ test/test_hypothesis/conftest.py
@@ -5,7 +5,7 @@
 
 import pytest
 import redis
-from hypothesis import settings
+from hypothesis import settings, strategies as st
 
 from .base import MachineConfig
 
@@ -16,6 +16,13 @@
 # iteration (set FAKEREDIS_HYPOTHESIS_EXAMPLES) while defaulting to a thorough-but-affordable count for CI.
 settings.register_profile("fakeredis", max_examples=int(os.environ.get("FAKEREDIS_HYPOTHESIS_EXAMPLES", "250")))
 settings.load_profile("fakeredis")
+
+
+@pytest.fixture(scope="session", autouse=True)
+def prepare_utf8_characters():
+    # Hypothesis builds this Unicode codec table on first use. Prepare the
+    # unchanged character strategy before timing state-machine input draws.
+    st.characters(codec="utf-8").validate()
 
 
 @pytest.fixture
