--- /dev/null
+++ test/test-copy-runner.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+set -eu
+test_copy=$1
+tmpdir=$(mktemp -d "${TMPDIR:-/tmp}/nemo-copy-test.XXXXXX")
+trap 'rm -rf "$tmpdir"' EXIT HUP INT TERM
+printf 'nemo test\n' >"$tmpdir/source"
+mkdir "$tmpdir/destination"
+"$test_copy" "$tmpdir/source" "$tmpdir/destination"
+test -f "$tmpdir/destination/source"
