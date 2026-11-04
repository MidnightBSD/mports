--- icu/makefile.mk.orig	2026-11-03 00:00:00 UTC
+++ icu/makefile.mk
@@ -74,6 +74,11 @@
 icu_CFLAGS+=-O $(ARCH_FLAGS) $(EXTRA_CDEFS)
 icu_LDFLAGS+=$(EXTRA_LINKFLAGS)
 icu_CXXFLAGS+=-O $(ARCH_FLAGS) $(EXTRA_CDEFS)
+.IF "$(OS)"=="FREEBSD"
+# ICU builds C++ with -ansi, which hides long long in <stdlib.h>, but
+# newer libc++ <stdlib.h> uses lldiv_t unconditionally.
+icu_CXXFLAGS+=-D__LONG_LONG_SUPPORTED
+.ENDIF
 
 # remove conversion and transliteration data to reduce binary size.
 CONFIGURE_ACTION=rm data/mappings/ucm*.mk data/translit/trn*.mk ;
