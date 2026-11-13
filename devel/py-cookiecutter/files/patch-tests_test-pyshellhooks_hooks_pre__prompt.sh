--- tests/test-pyshellhooks/hooks/pre_prompt.sh.orig
+++ tests/test-pyshellhooks/hooks/pre_prompt.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 echo 'Pre-Prompt hook';
 touch '_cookiecutter.json'
