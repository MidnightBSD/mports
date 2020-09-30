--- srclib/localcharset.h.orig	2020-09-29 16:22:45 UTC
+++ srclib/localcharset.h
@@ -44,21 +44,21 @@ extern const char * locale_charset (void
        name              MIME?             used by which systems
                                     (darwin = Mac OS X, windows = native Windows)
 
-   ASCII, ANSI_X3.4-1968       glibc solaris freebsd netbsd darwin minix cygwin
-   ISO-8859-1              Y   glibc aix hpux irix osf solaris freebsd netbsd openbsd darwin cygwin
-   ISO-8859-2              Y   glibc aix hpux irix osf solaris freebsd netbsd openbsd darwin cygwin
+   ASCII, ANSI_X3.4-1968       glibc solaris freebsd midnightbsd netbsd darwin minix cygwin
+   ISO-8859-1              Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd openbsd darwin cygwin
+   ISO-8859-2              Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd openbsd darwin cygwin
    ISO-8859-3              Y   glibc solaris cygwin
-   ISO-8859-4              Y   hpux osf solaris freebsd netbsd openbsd darwin
-   ISO-8859-5              Y   glibc aix hpux irix osf solaris freebsd netbsd openbsd darwin cygwin
+   ISO-8859-4              Y   hpux osf solaris freebsd midnightbsd netbsd openbsd darwin
+   ISO-8859-5              Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd openbsd darwin cygwin
    ISO-8859-6              Y   glibc aix hpux solaris cygwin
-   ISO-8859-7              Y   glibc aix hpux irix osf solaris freebsd netbsd openbsd darwin cygwin
+   ISO-8859-7              Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd openbsd darwin cygwin
    ISO-8859-8              Y   glibc aix hpux osf solaris cygwin
-   ISO-8859-9              Y   glibc aix hpux irix osf solaris freebsd darwin cygwin
-   ISO-8859-13                 glibc hpux solaris freebsd netbsd openbsd darwin cygwin
+   ISO-8859-9              Y   glibc aix hpux irix osf solaris freebsd midnightbsd darwin cygwin
+   ISO-8859-13                 glibc hpux solaris freebsd midnightbsd netbsd openbsd darwin cygwin
    ISO-8859-14                 glibc cygwin
-   ISO-8859-15                 glibc aix irix osf solaris freebsd netbsd openbsd darwin cygwin
-   KOI8-R                  Y   glibc hpux solaris freebsd netbsd openbsd darwin
-   KOI8-U                  Y   glibc freebsd netbsd openbsd darwin cygwin
+   ISO-8859-15                 glibc aix irix osf solaris freebsd midnightbsd netbsd openbsd darwin cygwin
+   KOI8-R                  Y   glibc hpux solaris freebsd midnightbsd netbsd openbsd darwin
+   KOI8-U                  Y   glibc freebsd midnightbsd netbsd openbsd darwin cygwin
    KOI8-T                      glibc
    CP437                       dos
    CP775                       dos
@@ -71,7 +71,7 @@ extern const char * locale_charset (void
    CP862                       dos
    CP864                       dos
    CP865                       dos
-   CP866                       freebsd netbsd openbsd darwin dos
+   CP866                       freebsd midnightbsd netbsd openbsd darwin dos
    CP869                       dos
    CP874                       windows dos
    CP922                       aix
@@ -83,29 +83,29 @@ extern const char * locale_charset (void
    CP1124                      aix
    CP1125                      dos
    CP1129                      aix
-   CP1131                      freebsd darwin
+   CP1131                      freebsd midnightbsd darwin
    CP1250                      windows
-   CP1251                      glibc hpux solaris freebsd netbsd openbsd darwin cygwin windows
+   CP1251                      glibc hpux solaris freebsd midnightbsd netbsd openbsd darwin cygwin windows
    CP1252                      aix windows
    CP1253                      windows
    CP1254                      windows
    CP1255                      glibc windows
    CP1256                      windows
    CP1257                      windows
-   GB2312                  Y   glibc aix hpux irix solaris freebsd netbsd darwin cygwin
-   EUC-JP                  Y   glibc aix hpux irix osf solaris freebsd netbsd darwin cygwin
-   EUC-KR                  Y   glibc aix hpux irix osf solaris freebsd netbsd darwin cygwin
+   GB2312                  Y   glibc aix hpux irix solaris freebsd midnightbsd netbsd darwin cygwin
+   EUC-JP                  Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd darwin cygwin
+   EUC-KR                  Y   glibc aix hpux irix osf solaris freebsd midnightbsd netbsd darwin cygwin
    EUC-TW                      glibc aix hpux irix osf solaris netbsd
-   BIG5                    Y   glibc aix hpux osf solaris freebsd netbsd darwin cygwin
+   BIG5                    Y   glibc aix hpux osf solaris freebsd midnightbsd netbsd darwin cygwin
    BIG5-HKSCS                  glibc hpux solaris netbsd darwin
-   GBK                         glibc aix osf solaris freebsd darwin cygwin windows dos
-   GB18030                     glibc hpux solaris freebsd netbsd darwin
-   SHIFT_JIS               Y   hpux osf solaris freebsd netbsd darwin
+   GBK                         glibc aix osf solaris freebsd midnightbsd darwin cygwin windows dos
+   GB18030                     glibc hpux solaris freebsd midnightbsd netbsd darwin
+   SHIFT_JIS               Y   hpux osf solaris freebsd midnightbsd netbsd darwin
    JOHAB                       glibc solaris windows
    TIS-620                     glibc aix hpux osf solaris cygwin
    VISCII                  Y   glibc
    TCVN5712-1                  glibc
-   ARMSCII-8                   glibc freebsd netbsd darwin
+   ARMSCII-8                   glibc freebsd midnightbsd netbsd darwin
    GEORGIAN-PS                 glibc cygwin
    PT154                       glibc netbsd cygwin
    HP-ROMAN8                   hpux
