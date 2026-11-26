--- crates/polars-sql/src/functions.rs.orig	2026-10-25 14:18:24 UTC
+++ crates/polars-sql/src/functions.rs
@@ -12,6 +12,7 @@ use polars_lazy::dsl::Expr;
 #[cfg(feature = "approx_quantile")]
 use polars_lazy::prelude::ApproxQuantileMethod;
 use polars_lazy::prelude::DataTypeExpr;
+#[allow(ambiguous_glob_imports)]
 use polars_plan::dsl::functions::{
     coalesce, col, cols, concat_str, datetime_ranges, element, int_range, int_ranges, len, lit,
     max_horizontal, min_horizontal, when,
