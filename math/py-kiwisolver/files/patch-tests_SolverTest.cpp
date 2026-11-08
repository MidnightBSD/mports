--- tests/SolverTest.cpp.orig
+++ tests/SolverTest.cpp
@@ -219,3 +219,52 @@
     EXPECT_FALSE(c1.violated());
     EXPECT_TRUE(c2.violated());
 }
+
+TEST(SolverTest, RejectedConstraintPreservesSolverState) {
+    for (int kind = 0; kind < 3; ++kind) {
+        Variable x("x");
+        Solver solver;
+        Constraint lower = x >= 10;
+        Constraint upper = x <= 20;
+        solver.addConstraint(lower);
+        solver.addConstraint(upper);
+        solver.addEditVariable(x, strength::strong);
+        solver.suggestValue(x, 99);
+        solver.updateVariables();
+        ASSERT_DOUBLE_EQ(x.value(), 20);
+        Constraint rejected = kind == 0 ? x == 30 : kind == 1 ? x >= 30 : x <= 0;
+        EXPECT_THROW(solver.addConstraint(rejected), UnsatisfiableConstraint);
+        EXPECT_FALSE(solver.hasConstraint(rejected));
+        EXPECT_TRUE(solver.hasConstraint(lower));
+        EXPECT_TRUE(solver.hasConstraint(upper));
+        EXPECT_TRUE(solver.hasEditVariable(x));
+        solver.updateVariables();
+        EXPECT_DOUBLE_EQ(x.value(), 20);
+        solver.removeConstraint(upper);
+        solver.updateVariables();
+        EXPECT_DOUBLE_EQ(x.value(), 99);
+        solver.suggestValue(x, 4);
+        solver.updateVariables();
+        EXPECT_DOUBLE_EQ(x.value(), 10);
+        solver.removeConstraint(lower);
+        solver.updateVariables();
+        EXPECT_DOUBLE_EQ(x.value(), 4);
+    }
+}
+
+TEST(SolverTest, RejectedAllDummyConstraintPreservesState) {
+    Variable x("x");
+    Solver solver;
+    Constraint fixed = x == 10;
+    Constraint rejected = x == 11;
+    solver.addConstraint(fixed);
+    EXPECT_THROW(solver.addConstraint(rejected), UnsatisfiableConstraint);
+    EXPECT_TRUE(solver.hasConstraint(fixed));
+    EXPECT_FALSE(solver.hasConstraint(rejected));
+    solver.updateVariables();
+    EXPECT_DOUBLE_EQ(x.value(), 10);
+    solver.removeConstraint(fixed);
+    solver.addConstraint(x == 12);
+    solver.updateVariables();
+    EXPECT_DOUBLE_EQ(x.value(), 12);
+}
