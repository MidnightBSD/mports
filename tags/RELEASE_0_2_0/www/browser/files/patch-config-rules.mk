--- config/rules.mk.orig	Tue Nov 28 12:03:37 2006
+++ config/rules.mk	Fri Oct 19 21:37:20 2007
@@ -442,9 +442,11 @@
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
 
 ifeq ($(OS_ARCH),NetBSD)
@@ -924,7 +926,7 @@
 LOBJS	+= $(SHARED_LIBRARY_LIBS)
 endif
 else
-ifneq (,$(filter OSF1 BSD_OS FreeBSD NetBSD OpenBSD SunOS Darwin,$(OS_ARCH)))
+ifneq (,$(filter OSF1 BSD_OS MidnightBSD FreeBSD NetBSD OpenBSD SunOS Darwin,$(OS_ARCH)))
 CLEANUP1	:= | egrep -v '(________64ELEL_|__.SYMDEF)'
 CLEANUP2	:= rm -f ________64ELEL_ __.SYMDEF
 else
