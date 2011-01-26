
$FreeBSD: ports/devel/llvm-devel/files/patch-tools_clang_include_clang_Analysis_Analyses_PrintfFormatString.h,v 1.1 2010/05/06 15:35:00 brooks Exp $

--- tools/clang/include/clang/Analysis/Analyses/PrintfFormatString.h.orig
+++ tools/clang/include/clang/Analysis/Analyses/PrintfFormatString.h
@@ -57,6 +57,7 @@
    InvalidSpecifier = 0,
     // C99 conversion specifiers.
    dArg, // 'd'
+   DArg, // 'D' FreeBSD specific specifiers
    iArg, // 'i',
    oArg, // 'o',
    uArg, // 'u',
@@ -82,6 +83,7 @@
    ObjCObjArg,    // '@'
    // GlibC specific specifiers.
    PrintErrno,    // 'm'
+   bArg,	// FreeBSD specific specifiers
    // Specifier ranges.
    IntArgBeg = dArg,
    IntArgEnd = iArg,
