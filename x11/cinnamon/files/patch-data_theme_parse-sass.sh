--- data/theme/parse-sass.sh.orig
+++ data/theme/parse-sass.sh
@@ -1,3 +1,5 @@
-#! /bin/bash
+#!/bin/sh

-pysassc ./cinnamon-sass/cinnamon.scss cinnamon.css
+SRC_DIR="${1:-.}"
+
+pysassc "$SRC_DIR/cinnamon-sass/cinnamon.scss" cinnamon.css
