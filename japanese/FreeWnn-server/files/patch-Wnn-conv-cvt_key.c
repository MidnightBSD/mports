Index: Wnn/conv/cvt_key.c
===================================================================
RCS file: /home/cvs/private/hrs/freewnn/Wnn/conv/cvt_key.c,v
retrieving revision 1.1.1.1
retrieving revision 1.2
diff -u -p -r1.1.1.1 -r1.2
--- Wnn/conv/cvt_key.c	20 Dec 2008 07:13:30 -0000	1.1.1.1
+++ Wnn/conv/cvt_key.c	20 Dec 2008 15:22:37 -0000	1.2
@@ -65,172 +65,165 @@
 extern struct CONVCODE tbl[];
 extern int cnv_tbl_cnt;         /* convert table count */
 
-
- /** int������ h ��ӥåȥ٥����Ȥߤʤ�����i�ӥåȤ�����å����뤤��Ω�Ƥ� */
+/** int������ h ��ӥåȥ٥����Ȥߤʤ�����i�ӥåȤ�����å����뤤��Ω�Ƥ� */
 #define BITONP(h, i) (h[i / BITSIZ] &  (1 << (i % BITSIZ)))
 #define BITOFP(h, i) (!BITONP(h, i))
 #define BIT_UP(h, i) (h[i / BITSIZ] |= (1 << (i % BITSIZ)))
 #define BITDWN(h, i) (h[i / BITSIZ] &= ~(1 << (i % BITSIZ)))
 
- /** �Ѵ������ɤΥ����å��ȥ������Ѵ� */
+/** �Ѵ������ɤΥ����å��ȥ������Ѵ� */
 int
-key_check (inbuf, conv_tbl, tbl_cnt, check_flg)
-     int inbuf[];               /* ���������ȥ�� */
-     struct CONVCODE conv_tbl[];        /* �������Ѵ��ơ��֥� */
-     int tbl_cnt;
-     int check_flg[];
+key_check (int inbuf[],			/* ���������ȥ�� */
+	   struct CONVCODE conv_tbl[],	/* �������Ѵ��ơ��֥� */
+	   int tbl_cnt,
+	   int check_flg[])
 {
-  int dist, base;
-  char *code_p;
-  int i;
-
-  for (base = 0; inbuf[base] != -1; base++)
-    {
-      for (dist = 0; dist < tbl_cnt; dist++)
-        {
-          if (BITONP (check_flg, dist) && conv_tbl[dist].fromkey != 0)
-            {
-              code_p = conv_tbl[dist].fromkey + base;
-              if (*code_p == (char) inbuf[base])
-                {
-                  if (*(code_p + 1) == (char) 0)
-                    {
-                      /* �ޥå����� */
-                      for (i = 0, base++; (inbuf[i] = inbuf[base]) != -1; i++, base++);
-                      return (conv_tbl[dist].tokey);
-                    }
-                  /* �ޤ��ޥå����Ƥ��ʤ� */
-                }
-              else
-                {
-                  BITDWN (check_flg, dist);     /* ̵�� */
-                }
-            }
-        }
-    }
-
-  /* �ӥåȥ٥��� check_flg[] ����0��tblcnt�ӥåȤ�Ω�ä��ޤ޻ĤäƤ���
-     ��Τ����뤫Ĵ�٤롣 */
-  for (i = 0; i < tbl_cnt / BITSIZ; i++)
-    {
-      if (check_flg[i])
-        return (-1);
-    }
-  if ((tbl_cnt %= BITSIZ) && (check_flg[i] & ~(~0 << tbl_cnt)))
-    return (-1);
-  /* return -1 �� �ޤ�̤�����ʪ������ */
+	int dist, base;
+	char *code_p;
+	int i;
+
+	for (base = 0; inbuf[base] != -1; base++) {
+		for (dist = 0; dist < tbl_cnt; dist++) {
+			if (BITONP (check_flg, dist) && conv_tbl[dist].fromkey != 0) {
+				code_p = conv_tbl[dist].fromkey + base;
+
+				if (*code_p == (char) inbuf[base]) {
+					if (*(code_p + 1) == (char) 0) {
+						/* �ޥå����� */
+						for (i = 0, base++; (inbuf[i] = inbuf[base]) != -1; i++, base++);
+						return (conv_tbl[dist].tokey);
+					}
+					/* �ޤ��ޥå����Ƥ��ʤ� */
+				} else {
+					/* ̵�� */
+					BITDWN (check_flg, dist);
+				}
+			}
+		}
+	}
+
+	/* �ӥåȥ٥��� check_flg[] ����0��tblcnt�ӥåȤ�Ω�ä��ޤ޻ĤäƤ���
+	   ��Τ����뤫Ĵ�٤롣 */
+
+	for (i = 0; i < tbl_cnt / BITSIZ; i++) {
+		if (check_flg[i])
+			return (-1);
+	}
+
+	if ((tbl_cnt %= BITSIZ) && (check_flg[i] & ~(~0 << tbl_cnt)))
+		return (-1);
+	/* return -1 �� �ޤ�̤�����ʪ������ */
 
-  return (-2);                  /* �Ѵ��оݤȤʤ�ʪ�Ϥʤ� */
+	/* �Ѵ��оݤȤʤ�ʪ�Ϥʤ� */
+	return (-2);
 }
 
- /** ���ꤵ�줿�Ѵ��ơ��֥�˽��äƥ������Ѵ����롣*/
+/** ���ꤵ�줿�Ѵ��ơ��֥�˽��äƥ������Ѵ����롣*/
 int
-convert_key (inkey, conv_tbl, tbl_cnt, matching_flg, in_buf)
-     int (*inkey) ();           /* �������ϴؿ� */
-     struct CONVCODE conv_tbl[];        /* �Ѵ��ơ��֥� */
-     int tbl_cnt;               /* conv_tbl[] �θĿ� */
-     int matching_flg;          /* �ޥå��󥰤��ʤ��ä����ȥ�󥰤ν�������
-                                   0 : ���ͤȤ����֤�
-                                   1 : ���Υ��ȥ�󥰤ϼΤƤ�   */
-     char *in_buf;
+convert_key (int (*inkey)(),		/* �������ϴؿ� */
+	     struct CONVCODE conv_tbl[],	/* �Ѵ��ơ��֥� */
+	     int tbl_cnt,		/* conv_tbl[] �θĿ� */
+	     int matching_flg,       /* �ޥå��󥰤��ʤ��ä����ȥ�󥰤ν�������
+					0 : ���ͤȤ����֤�
+					1 : ���Υ��ȥ�󥰤ϼΤƤ�   */
+	     char *in_buf)
 {
 #define MAX     20              /* �������ϥХåե��κ����� */
 
-  static int inbuf[MAX];        /* �������ϥХåե� */
-  /* �Хåե��ν�ü�ϡ�-1 �Ǽ�����롣 */
-
-  int out_cnt;                  /* ���ϥХåե��ν��ϥ������ */
-
-  static int buf_cnt = 0;       /* inbuf �����ϻ��Υ�����   */
-
-  int check_flg[CHANGE_MAX];
-  /* �ӥåȥ٥����Ȥ��ư���졢�ޥå��󥰻����оݤȤʤäƤ���conv_tbl[]
-     �򼨤���1�λ��оݤȤʤꡢ0�����о� */
-
-  int i, c, flg = 0;            /* work */
-
-  for (i = 0; i < div_up (tbl_cnt, BITSIZ); check_flg[i++] = ~0);
-  /* ����check_flg��ӥåȥ٥�����������������0��tbl_cnt �ӥåȤ�Ω�Ƥ롣
-     â�����ºݤϤ��ξ�����ޤ�Ω�� */
-
-  for (;;)
-    {
-      if (flg != 0 || buf_cnt == 0)
-        {
-          inbuf[buf_cnt] = (*inkey) (); /* ��ʸ������ */
-          in_buf[buf_cnt] = (char) (inbuf[buf_cnt] & 0xff);
-          if (inbuf[buf_cnt] == -1)
-            {
-              if (buf_cnt > 0)
-                {
-                  c = -2;       /* �����ॢ���� */
-                  goto LABEL;
-                }
-              else
-                {
-                  continue;
-                }
-            }
-          else
-            {
-              inbuf[++buf_cnt] = -1;    /* �����ߥ͡��� */
-            }
-        }
-      flg++;
-
-      if (buf_cnt >= MAX - 1)
-        {
-          in_buf[0] = '\0';
-          return (-1);          /* ERROR */
-        }
-
-      c = key_check (inbuf, conv_tbl, tbl_cnt, check_flg);
-    LABEL:
-      switch (c)
-        {
-        case -1:                /* ̤���� */
-          continue;
-
-        case -2:                /* �Ѵ��оݤǤʤ����Ȥ����ꤷ�� */
-          buf_cnt--;
-          out_cnt = 0;
-          c = inbuf[out_cnt++];
-          for (i = 0; inbuf[i] != -1; inbuf[i++] = inbuf[out_cnt++]);
-          if (matching_flg != 0)
-            {
-              flg = 0;
-              continue;
-            }
-          in_buf[0] = '\0';
-          return (c);
-
-        default:                /* �Ѵ����줿������ */
-          in_buf[buf_cnt] = '\0';
-          buf_cnt = 0;
-          return (c);
-        }
-    }
+        /* �������ϥХåե� */
+	/* �Хåե��ν�ü�ϡ�-1 �Ǽ�����롣 */
+	static int inbuf[MAX];
+
+	/* ���ϥХåե��ν��ϥ������ */
+	int out_cnt;
+	
+	/* inbuf �����ϻ��Υ�����   */
+	static int buf_cnt = 0;
+
+
+	/* �ӥåȥ٥����Ȥ��ư���졢�ޥå��󥰻����оݤȤʤäƤ���conv_tbl[]
+	   �򼨤���1�λ��оݤȤʤꡢ0�����о� */
+	int check_flg[CHANGE_MAX];
+
+	/* work */
+	int i, c, flg = 0;
+
+	for (i = 0; i < div_up (tbl_cnt, BITSIZ); check_flg[i++] = ~0);
+	/* ����check_flg��ӥåȥ٥�����������������0��tbl_cnt �ӥåȤ�Ω�Ƥ롣
+	   â�����ºݤϤ��ξ�����ޤ�Ω�� */
+
+	for (;;) {
+		if (flg != 0 || buf_cnt == 0) {
+			inbuf[buf_cnt] = (*inkey) (); /* ��ʸ������ */
+			in_buf[buf_cnt] = (char) (inbuf[buf_cnt] & 0xff);
+			if (inbuf[buf_cnt] == -1) {
+				if (buf_cnt > 0) {
+					c = -2;
+					/* �����ॢ���� */
+					goto LABEL;
+				} else {
+					continue;
+				}
+			} else {
+				/* �����ߥ͡��� */
+				inbuf[++buf_cnt] = -1;
+			}
+		}
+		flg++;
+
+		if (buf_cnt >= MAX - 1) {
+			in_buf[0] = '\0';
+
+			/* ERROR */
+			return (-1);
+		}
+
+		c = key_check (inbuf, conv_tbl, tbl_cnt, check_flg);
+
+	LABEL:
+		switch (c) {
+		case -1:
+			/* ̤���� */
+			continue;
+
+		case -2:
+			/* �Ѵ��оݤǤʤ����Ȥ����ꤷ�� */
+			buf_cnt--;
+			out_cnt = 0;
+			c = inbuf[out_cnt++];
+			for (i = 0; inbuf[i] != -1; inbuf[i++] = inbuf[out_cnt++]);
+
+			if (matching_flg != 0) {
+				flg = 0;
+				continue;
+			}
+
+			in_buf[0] = '\0';
+			return (c);
+
+		default:
+			/* �Ѵ����줿������ */
+			in_buf[buf_cnt] = '\0';
+			buf_cnt = 0;
+			return (c);
+		}
+	}
 }
 
  /** �������Ѵ���ȼ���������ϴؿ� */
 int
-keyin1 (get_ch, in_buf)
-     int (*get_ch) ();          /* getchar() ��Ʊ�ͤδؿ� */
-     char *in_buf;
+keyin1(int (*get_ch)(),          /* getchar() ��Ʊ�ͤδؿ� */
+       char *in_buf)
 {
-  int ret;
+	int ret;
 
-  for (;;)
-    {
-      if (cnv_tbl_cnt == 0)
-        {
-          ret = (*get_ch) ();
-          if (ret >= 0)
-            return (ret);
-        }
-      else
-        {
-          return (convert_key (get_ch, tbl, cnv_tbl_cnt, 0, in_buf));
-        }
-    }
+	for (;;) {
+		if (cnv_tbl_cnt == 0) {
+			ret = (*get_ch)();
+			if (ret >= 0)
+				return (ret);
+		} else {
+			return (convert_key(get_ch, tbl, cnv_tbl_cnt, 0, in_buf));
+		}
+	}
 }
