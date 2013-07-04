--- config/rules.mk.orig	2008-06-24 19:29:46 -0400
+++ config/rules.mk	2009-04-18 02:14:03 -0400
@@ -468,11 +468,14 @@
 endif
 
 ifeq ($(OS_ARCH),FreeBSD)
-ifdef IS_COMPONENT
-EXTRA_DSO_LDOPTS += -Wl,-Bsymbolic
+EXTRA_DSO_LDOPTS += -Wl,-Bsymbolic -lc
 endif
+
+ifeq ($(OS_ARCH),MidnightBSD)
+EXTRA_DSO_LDOPTS += -Wl,-Bsymbolic -lc
 endif
 
+
 ifeq ($(OS_ARCH),NetBSD)
 ifneq (,$(filter arc cobalt hpcmips mipsco newsmips pmax sgimips,$(OS_TEST)))
 ifeq ($(MODULE),layout)
@@ -1012,7 +1015,7 @@
 LOBJS	+= $(SHARED_LIBRARY_LIBS)
 endif
 else
-ifneq (,$(filter OSF1 BSD_OS FreeBSD NetBSD OpenBSD SunOS Darwin,$(OS_ARCH)))
+ifneq (,$(filter OSF1 BSD_OS MidnightBSD FreeBSD NetBSD OpenBSD SunOS Darwin,$(OS_ARCH)))
 CLEANUP1	:= | egrep -v '(________64ELEL_|__.SYMDEF)'
 CLEANUP2	:= rm -f ________64ELEL_ __.SYMDEF
 else
