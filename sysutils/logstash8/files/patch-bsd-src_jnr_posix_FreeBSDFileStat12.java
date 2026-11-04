--- bsd-src/jnr/posix/FreeBSDFileStat12.java.orig	2025-10-24 15:13:46 UTC
+++ bsd-src/jnr/posix/FreeBSDFileStat12.java
@@ -41,13 +41,11 @@
         }
 
         public final class time_t extends SignedLong {}
-        public final class dev_t extends Signed32 {}
+        public final class dev_t extends Unsigned64 {}
 
         public final dev_t  st_dev = new dev_t();
         public final Signed64  st_ino = new Signed64();
-        // FIXME: this should be a 64-bit field
-        public final Signed32  st_nlink_upper = new Signed32();
-        public final Signed32  st_nlink = new Signed32();
+        public final Unsigned64 st_nlink = new Unsigned64();
         public final Signed16  st_mode = new Signed16();
         public final Signed16  st_padding0 = new Signed16();
         public final Signed32  st_uid = new Signed32();
@@ -67,8 +65,16 @@
         public final Signed32  st_blksize = new Signed32();
         public final Signed32  st_flags = new Signed32();
         public final Signed64  st_gen = new Signed64();
-        /* FIXME: This padding isn't quite correct */
-        public final Signed64  st_qspare0 = new Signed64();
+        public final Unsigned64 st_spare0 = new Unsigned64();
+        public final Unsigned64 st_spare1 = new Unsigned64();
+        public final Unsigned64 st_spare2 = new Unsigned64();
+        public final Unsigned64 st_spare3 = new Unsigned64();
+        public final Unsigned64 st_spare4 = new Unsigned64();
+        public final Unsigned64 st_spare5 = new Unsigned64();
+        public final Unsigned64 st_spare6 = new Unsigned64();
+        public final Unsigned64 st_spare7 = new Unsigned64();
+        public final Unsigned64 st_spare8 = new Unsigned64();
+        public final Unsigned64 st_spare9 = new Unsigned64();
     }
     private static final Layout layout = new Layout(jnr.ffi.Runtime.getSystemRuntime());
 
@@ -113,7 +119,7 @@
     }
 
     public int nlink() {
-        return layout.st_nlink.get(memory);
+        return (int) layout.st_nlink.get(memory);
     }
 
     public long rdev() {
