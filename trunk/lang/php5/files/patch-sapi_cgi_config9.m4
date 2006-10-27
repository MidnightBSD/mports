--- sapi/cgi/config9.m4.orig	Thu Feb  2 10:59:23 2006
+++ sapi/cgi/config9.m4	Thu May  4 11:19:41 2006
@@ -80,7 +80,6 @@
 ])
 
 
-if test "$PHP_SAPI" = "default"; then
   AC_MSG_CHECKING(for CGI build)
   if test "$PHP_SAPI_CGI" != "no"; then
     AC_MSG_RESULT(yes)
@@ -145,8 +144,9 @@
     AC_DEFINE_UNQUOTED(PHP_FCGI_STATIC, $PHP_FCGI_STATIC, [ ])
     AC_MSG_RESULT($PHP_ENABLE_FASTCGI)
 
-    INSTALL_IT="@echo \"Installing PHP CGI into: \$(INSTALL_ROOT)\$(bindir)/\"; \$(INSTALL) -m 0755 \$(SAPI_CGI_PATH) \$(INSTALL_ROOT)\$(bindir)/\$(program_prefix)php\$(program_suffix)\$(EXEEXT)"
-    PHP_SELECT_SAPI(cgi, program, $PHP_FCGI_FILES cgi_main.c getopt.c, , '$(SAPI_CGI_PATH)')
+    INSTALL_CGI="@echo \"Installing PHP CGI into: \$(INSTALL_ROOT)\$(bindir)/\"; \$(INSTALL) -m 0755 \$(SAPI_CGI_PATH) \$(INSTALL_ROOT)\$(bindir)/\$(program_prefix)php-cgi\$(program_suffix)\$(EXEEXT)"
+    PHP_ADD_SOURCES(sapi/cgi, $PHP_FCGI_FILES cgi_main.c getopt.c,, cgi)
+    PHP_ADD_SOURCES(/main, internal_functions.c,,cgi)
 
     case $host_alias in
       *aix*)
@@ -156,17 +156,29 @@
         BUILD_CGI="\$(CC) \$(CFLAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(NATIVE_RPATHS) \$(PHP_GLOBAL_OBJS:.lo=.o) \$(PHP_SAPI_OBJS:.lo=.o) \$(PHP_FRAMEWORKS) \$(EXTRA_LIBS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CGI_PATH)"
       ;;
       *)
-        BUILD_CGI="\$(LIBTOOL) --mode=link \$(CC) -export-dynamic \$(CFLAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(PHP_RPATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_SAPI_OBJS) \$(EXTRA_LIBS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CGI_PATH)"
+        BUILD_CGI="\$(LIBTOOL) --mode=link \$(CC) -export-dynamic \$(CFLAGS_CLEAN) \$(EXTRA_CFLAGS) \$(EXTRA_LDFLAGS_PROGRAM) \$(LDFLAGS) \$(PHP_RPATHS) \$(PHP_GLOBAL_OBJS) \$(PHP_CGI_OBJS) \$(EXTRA_LIBS) \$(ZEND_EXTRA_LIBS) -o \$(SAPI_CGI_PATH)"
       ;;
     esac
 
+    PHP_CGI_TARGET="\$(SAPI_CGI_PATH)"
+    PHP_INSTALL_CGI_TARGET="install-cgi"
     PHP_SUBST(BUILD_CGI)
+    PHP_SUBST(INSTALL_CGI)
+    PHP_SUBST(PHP_CGI_OBJS)
+    PHP_SUBST(PHP_CGI_TARGET)
+    PHP_SUBST(PHP_INSTALL_CGI_TARGET)
 
-  elif test "$PHP_SAPI_CLI" != "no"; then
-    AC_MSG_RESULT(no)
+    if test "$PHP_SAPI" = "default" ; then
+      PHP_BUILD_PROGRAM($SAPI_CGI_PATH)
+    fi
+ else
+  AC_MSG_RESULT(no)
+  if test "$PHP_SAPI" = "default" ; then
+    if test "$PHP_SAPI_CLI" != "no" ; then
     OVERALL_TARGET=
     PHP_SAPI=cli   
   else
     AC_MSG_ERROR([No SAPIs selected.])  
   fi
+ fi
 fi
