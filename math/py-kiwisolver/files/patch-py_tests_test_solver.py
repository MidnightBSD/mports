--- py/tests/test_solver.py.orig
+++ py/tests/test_solver.py
@@ -293,3 +293,51 @@
     assert v.value() >= 10
     assert c1.violated() is False
     assert c2.violated() is True
+
+
+@pytest.mark.parametrize("kind", ["equality", "lower", "upper"])
+def test_rejected_constraint_preserves_solver_state(kind: str) -> None:
+    """Rejecting an impossible constraint must preserve edits and bounds."""
+    x = Variable("x")
+    solver = Solver()
+    lower, upper = x >= 10, x <= 20
+    solver.addConstraint(lower)
+    solver.addConstraint(upper)
+    solver.addEditVariable(x, "strong")
+    solver.suggestValue(x, 99)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(20)
+    rejected = {"equality": x == 30, "lower": x >= 30, "upper": x <= 0}[kind]
+    with pytest.raises(UnsatisfiableConstraint):
+        solver.addConstraint(rejected)
+    assert not solver.hasConstraint(rejected)
+    assert solver.hasConstraint(lower) and solver.hasConstraint(upper)
+    assert solver.hasEditVariable(x)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(20)
+    solver.removeConstraint(upper)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(99)
+    solver.suggestValue(x, 4)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(10)
+    solver.removeConstraint(lower)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(4)
+
+
+def test_rejected_all_dummy_constraint_preserves_state() -> None:
+    x = Variable("x")
+    solver = Solver()
+    fixed = x == 10
+    solver.addConstraint(fixed)
+    rejected = x == 11
+    with pytest.raises(UnsatisfiableConstraint):
+        solver.addConstraint(rejected)
+    assert solver.hasConstraint(fixed) and not solver.hasConstraint(rejected)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(10)
+    solver.removeConstraint(fixed)
+    solver.addConstraint(x == 12)
+    solver.updateVariables()
+    assert x.value() == pytest.approx(12)
