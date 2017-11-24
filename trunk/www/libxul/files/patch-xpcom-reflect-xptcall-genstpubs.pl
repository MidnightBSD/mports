--- xpcom/reflect/xptcall/genstubs.pl.orig	2016-10-24 12:00:03.928349888 -0400
+++ xpcom/reflect/xptcall/genstubs.pl	2016-10-24 12:08:51.386352099 -0400
@@ -44,7 +44,7 @@
 print OUTFILE "*  1 is AddRef\n";
 print OUTFILE "*  2 is Release\n";
 print OUTFILE "*/\n";
-print OUTFILE "#if !defined(__ia64) || (!defined(__hpux) && !defined(__linux__) && !defined(__FreeBSD__))\n";
+print OUTFILE "#if !defined(__ia64) || (!defined(__hpux) && !defined(__linux__) && !defined(__MidnightBSD__))\n";
 for($i = 0; $i < $entry_count; $i++) {
     print OUTFILE "NS_IMETHOD Stub",$i+3,"();\n";
 }
