--- Help/command/string.rst.orig
+++ Help/command/string.rst
@@ -22,7 +22,7 @@
     string(`JOIN`_ <glue> <out-var> [<input>...])
     string(`TOLOWER`_ <string> <out-var>)
     string(`TOUPPER`_ <string> <out-var>)
-    string(`LENGTH <LENGTH_>`_ <string> <out-var>)
+    string(`LENGTH <LENGTH_>`__ <string> <out-var>)
     string(`SUBSTRING`_ <string> <begin> <length> <out-var>)
     string(`STRIP`_ <string> <out-var>)
     string(`GENEX_STRIP`_ <string> <out-var>)
@@ -45,7 +45,7 @@

   `JSON`_
     string(JSON <out-var> [ERROR_VARIABLE <error-var>]
-           {`GET <JSON GET_>`_ | `TYPE <JSON TYPE_>`_ | `LENGTH <JSON LENGTH_>`_ | `REMOVE <JSON REMOVE_>`_}
+           {`GET <JSON GET_>`_ | `TYPE <JSON TYPE_>`_ | `LENGTH <JSON LENGTH_>`__ | `REMOVE <JSON REMOVE_>`_}
            <json-string> <member|index> [<member|index> ...])
     string(JSON <out-var> [ERROR_VARIABLE <error-var>]
            `MEMBER <JSON MEMBER_>`_ <json-string>
