--- src/cocotb/_vendor/fli/mti.h.orig
+++ src/cocotb/_vendor/fli/mti.h
@@ -255,3 +255,11 @@ struct mtiInt64TimeVal_ {
 # define MTI_TIME64_INIT(h,l)    {{(h), (l)}}
+#elif defined(__BYTE_ORDER__) && defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	unsigned int lo;
+	int          hi;
+# define MTI_TIME64_INIT(h,l)    {{(l), (h)}}
+#elif defined(__BYTE_ORDER__) && defined(__ORDER_BIG_ENDIAN__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+	int          hi;
+	unsigned int lo;
+# define MTI_TIME64_INIT(h,l)    {{(h), (l)}}
 #else
 #error "don't know how to determine endian-ness on this machine!"
 #endif
