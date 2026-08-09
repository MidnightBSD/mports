Put the in-tree include directories (LOCAL_CFLAGS) ahead of CFLAGS/CPPFLAGS.

On MidnightBSD iconv comes from converters/libiconv, so the port adds
-I${LOCALBASE}/include via CPPFLAGS.  With the original ordering that
directory is searched before ${WRKSRC}/include, so mlmmj's own archive.h
and unistr.h are shadowed by libarchive's and libunistring's installed
headers, and the build fails with -Werror=implicit-function-declaration
on archive_open() and unistr_utf8_to_header().

--- mk/common.mk.orig
+++ mk/common.mk
@@ -18,10 +18,10 @@
 .SUFFIXES: .pico
 
 .c.o:
-	$(CC) -Wall -Wextra -std=gnu17 -D_GNU_SOURCE=1 -MT $@ -MD -MP -MF $*.Tpo -o $@ -c $(CFLAGS) $(LOCAL_CFLAGS) $<
+	$(CC) -Wall -Wextra -std=gnu17 -D_GNU_SOURCE=1 -MT $@ -MD -MP -MF $*.Tpo -o $@ -c $(LOCAL_CFLAGS) $(CFLAGS) $<
 	mv $*.Tpo $*.Po
 
 .c.pico:
-	$(CC) -Wall -Wextra -std=gnu17 -D_GNU_SOURCE=1 -MT $@ -MD -MP -MF $*.Tpico -o $@ -c $(CFLAGS) $(LOCAL_CFLAGS) $(SHOBJ_CFLAGS) $<
+	$(CC) -Wall -Wextra -std=gnu17 -D_GNU_SOURCE=1 -MT $@ -MD -MP -MF $*.Tpico -o $@ -c $(LOCAL_CFLAGS) $(CFLAGS) $(SHOBJ_CFLAGS) $<
 	mv $*.Tpico $*.Ppico
 
 clean: clean-files
