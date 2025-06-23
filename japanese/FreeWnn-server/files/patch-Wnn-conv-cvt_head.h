Index: Wnn/conv/cvt_head.h
===================================================================
RCS file: /home/cvs/private/hrs/freewnn/Wnn/conv/cvt_head.h,v
retrieving revision 1.1.1.1
retrieving revision 1.2
diff -u -p -r1.1.1.1 -r1.2
--- Wnn/conv/cvt_head.h	20 Dec 2008 07:13:30 -0000	1.1.1.1
+++ Wnn/conv/cvt_head.h	20 Dec 2008 15:22:37 -0000	1.2
@@ -52,17 +52,17 @@
 
 #ifdef WNNDEFAULT
 #  include "wnn_config.h"
- /* �ޥ���CONVERT_FILENAME������ʤΤ�������ˡ�����ѥ�����ϡ��إå��ե�����
-    �Υ������ѥ��ˡ�Wnn�Υ��󥯥롼�ɥե�����Τ��꤫�����ꤷ�Ƥ������ȡ� */
+/* �ޥ���CONVERT_FILENAME������ʤΤ�������ˡ�����ѥ�����ϡ��إå��ե�����
+   �Υ������ѥ��ˡ�Wnn�Υ��󥯥롼�ɥե�����Τ��꤫�����ꤷ�Ƥ������ȡ� */
 #else
 #  define CONVERT_FILENAME "cvt_key_tbl"
 #endif
 
 #define div_up(a, b) ((a + b - 1) / b)
- /* a,b������������a/b���ڤ�夲�������ˤ��� */
+/* a,b������������a/b���ڤ�夲�������ˤ��� */
 
 struct CONVCODE
 {
-  int tokey;                    /* �Ѵ����줿������ */
-  char *fromkey;                /* �Ѵ����륳���� */
+	int tokey;	/* �Ѵ����줿������ */
+	char *fromkey;	/* �Ѵ����륳���� */
 };
