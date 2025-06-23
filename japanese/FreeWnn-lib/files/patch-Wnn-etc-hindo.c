Index: Wnn/etc/hindo.c
===================================================================
RCS file: /home/cvs/private/hrs/freewnn/Wnn/etc/hindo.c,v
retrieving revision 1.1.1.1
retrieving revision 1.2
diff -u -p -r1.1.1.1 -r1.2
--- Wnn/etc/hindo.c	20 Dec 2008 07:13:30 -0000	1.1.1.1
+++ Wnn/etc/hindo.c	20 Dec 2008 15:22:40 -0000	1.2
@@ -5,7 +5,7 @@
 /*
  * FreeWnn is a network-extensible Kana-to-Kanji conversion system.
  * This file is part of FreeWnn.
- * 
+ *
  * Copyright Kyoto University Research Institute for Mathematical Sciences
  *                 1987, 1988, 1989, 1990, 1991, 1992
  * Copyright OMRON Corporation. 1987, 1988, 1989, 1990, 1991, 1992, 1999
@@ -49,8 +49,8 @@
         �����٤�b�ΤȤ������٤ι����γ�Ψ�� 1 / ([b��4]��1)
         â�� b��0�λ��ϡ����ٹ�����Ψ 0
 
-    
-         a == -1 <==> b == 0x7f = 127; 
+
+         a == -1 <==> b == 0x7f = 127;
         ���λ������Υ���ȥ꡼�ϡ��Ѵ��˷褷���Ѥ����ʤ�
         (�����ȥ����Ȥ���Ƥ���)���Ȥ�ɽ����
                         9/1/89 H.T.
@@ -58,47 +58,48 @@
 
  /** ����������ʿ�����ؿ���â������<0�λ��Υ��顼�����å��Ϥʤ���0���֤��ˡ�*/
 static int
-isqrt (i)
-     int i;
+isqrt(int i)
 {
-  register int a, b;
+	register int a, b;
+
+	if (i <= 0)
+		return (0);
+
+	for (a = i, b = 1; b <<= 1, a >>= 2;);
+
+	while ((a = i / b) < b)
+		b = (b + a) >> 1;
 
-  if (i <= 0)
-    return (0);
-  for (a = i, b = 1; b <<= 1, a >>= 2;);
-  while ((a = i / b) < b)
-    b = (b + a) >> 1;
-  return (b);
+	return (b);
 }
 
  /** ������a��������b */
 int
-asshuku (hin)
-     int hin;
+asshuku(int hin)
 {
-  register int c;
+	register int c;
 
-  if (hin == -1)
-    return (127);
-  if (hin <= 4)
-    return (hin);
-  /* ��Ⱦ������0�����ꤷ�ƤΥ��ԡ��ɥ��åס�motoni1,2�Ǥ�Ʊ�� */
-
-  c = (isqrt ((hin <<= 1) + 1) + 1) & ~1;
-  c += hin / c - 2;
-  return (c < 126 ? c : 126);
+	if (hin == -1)
+		return (127);
+	if (hin <= 4)
+		return (hin);
+	/* ��Ⱦ������0�����ꤷ�ƤΥ��ԡ��ɥ��åס�motoni1,2�Ǥ�Ʊ�� */
+
+	c = (isqrt((hin <<= 1) + 1) + 1) & ~1;
+	c += hin / c - 2;
+
+	return (c < 126 ? c : 126);
 }
 
  /** ������b��������(min)a */
 /*
 int
-motoni1(hin)
-int     hin;
+motoni1(int hin)
 {
         register int    c;
 
         if(hin == 127) return(-1);
-        if(hin <= 4) return(hin); 
+        if(hin <= 4) return(hin);
         c = hin >> 2;
         return( (hin - (c << 1)) * (c + 1) );
 }
@@ -106,15 +107,17 @@ int     hin;
 
  /** ������b��������(mid)a */
 int
-motoni2 (hin)
-     int hin;
+motoni2(int hin)
 {
-  register int c;
+	register int c;
+
+	if (hin == 127)
+		return (-1);
+
+	if (hin <= 4)
+		return (hin);
+
+	c = hin >> 2;
 
-  if (hin == 127)
-    return (-1);
-  if (hin <= 4)
-    return (hin);
-  c = hin >> 2;
-  return ((hin - (c << 1)) * (c + 1) + (c >> 1));
+	return ((hin - (c << 1)) * (c + 1) + (c >> 1));
 }
