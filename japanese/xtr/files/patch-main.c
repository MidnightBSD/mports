--- src/main.c.orig	Wed Jul 23 17:02:16 2003
+++ src/main.c	Wed Jul 23 17:03:32 2003
@@ -401,10 +401,10 @@
 int stdinmode;				/* ɸ�����Ϥ������� */
 uchar *ifilename;			/* ���ߤ����ϥե�����̾ */
 uchar *ifilename1;			/* ���ϥե�����̾����ɽ */
-FILE *ifp = stdin;
+FILE *ifp;
 int stdoutmode;				/* ɸ����Ϥؽ��� */
 uchar *ofilename;
-FILE *ofp = stdout;
+FILE *ofp;
 uchar *bakfilename;			/* .BAK �˥�͡��व�줿���ϥե�����̾ */
 
 
