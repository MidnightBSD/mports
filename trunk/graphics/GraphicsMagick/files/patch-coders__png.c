--- coders/png.c.orig	2008-01-18 00:34:17.000000000 +0100
+++ coders/png.c	2012-04-29 07:23:05.000000000 +0200
@@ -73,6 +73,7 @@
 #if defined(HasPNG)
 #include "png.h"
 #include "zlib.h"
+#include "pngpriv.h"
 
 #if PNG_LIBPNG_VER > 95
 /*
@@ -1365,7 +1366,7 @@
       "  libpng-%.1024s error: %.1024s", PNG_LIBPNG_VER_STRING,
       message);
   (void) ThrowException2(&image->exception,CoderError,message,image->filename);
-  longjmp(ping->jmpbuf,1);
+  longjmp(png_jmpbuf(ping),1);
 }
 
 static void PNGWarningHandler(png_struct *ping,png_const_charp message)
@@ -1660,7 +1661,7 @@
       ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image)
     }
   png_pixels=(unsigned char *) NULL;
-  if (setjmp(ping->jmpbuf))
+  if (setjmp(png_jmpbuf(ping)))
     {
       /*
         PNG image is corrupt.
@@ -2038,10 +2039,10 @@
       /*
         Image has a transparent background.
       */
-      transparent_color.red=(int) (ping_info->trans_values.red*scale);
-      transparent_color.green=(int) (ping_info->trans_values.green*scale);
-      transparent_color.blue=(int) (ping_info->trans_values.blue*scale);
-      transparent_color.opacity=(int) (ping_info->trans_values.gray*scale);
+      transparent_color.red=(int) (ping_info->trans_color.red*scale);
+      transparent_color.green=(int) (ping_info->trans_color.green*scale);
+      transparent_color.blue=(int) (ping_info->trans_color.blue*scale);
+      transparent_color.opacity=(int) (ping_info->trans_color.gray*scale);
       if (ping_info->color_type == PNG_COLOR_TYPE_GRAY)
         {
           transparent_color.red=transparent_color.opacity;
@@ -2547,7 +2548,7 @@
                 index=indexes[x];
                 if (index < ping_info->num_trans)
                   q->opacity=
-                    ScaleCharToQuantum(255-ping_info->trans[index]);
+                    ScaleCharToQuantum(255-ping_info->trans_alpha[index]);
                 q++;
               }
             else if (ping_info->color_type == PNG_COLOR_TYPE_GRAY)
@@ -6030,7 +6031,7 @@
   png_set_write_fn(ping,image,png_put_data,png_flush_data);
   png_pixels=(unsigned char *) NULL;
 
-  if (setjmp(ping->jmpbuf))
+  if (setjmp(png_jmpbuf(ping)))
     {
       /*
         PNG write failed.
@@ -6229,12 +6230,12 @@
           /*
             Identify which colormap entry is transparent.
           */
-          ping_info->trans=MagickAllocateMemory(unsigned char *,number_colors);
-          if (ping_info->trans == (unsigned char *) NULL)
+          ping_info->trans_alpha=MagickAllocateMemory(unsigned char *,number_colors);
+          if (ping_info->trans_alpha == (unsigned char *) NULL)
             ThrowWriterException(ResourceLimitError,MemoryAllocationFailed,image);
           assert(number_colors <= 256);
           for (i=0; i < (long) number_colors; i++)
-             ping_info->trans[i]=255;
+             ping_info->trans_alpha[i]=255;
           for (y=0; y < (long) image->rows; y++)
           {
             register const PixelPacket
@@ -6254,7 +6255,7 @@
 
                   index=indexes[x];
                   assert((unsigned long) index < number_colors);
-                  ping_info->trans[index]=(png_byte) (255-
+                  ping_info->trans_alpha[index]=(png_byte) (255-
                     ScaleQuantumToChar(p->opacity));
                 }
               p++;
@@ -6262,14 +6263,14 @@
           }
           ping_info->num_trans=0;
           for (i=0; i < (long) number_colors; i++)
-            if (ping_info->trans[i] != 255)
+            if (ping_info->trans_alpha[i] != 255)
               ping_info->num_trans=(unsigned short) (i+1);
           if (ping_info->num_trans == 0)
             ping_info->valid&=(~PNG_INFO_tRNS);
           if (!(ping_info->valid & PNG_INFO_tRNS))
             ping_info->num_trans=0;
           if (ping_info->num_trans == 0)
-            MagickFreeMemory(ping_info->trans);
+            MagickFreeMemory(ping_info->trans_alpha);
           /*
             Identify which colormap entry is the background color.
           */
@@ -6388,12 +6389,12 @@
               if (ping_info->bit_depth == 1)
                  mask=0x0001;
               ping_info->valid|=PNG_INFO_tRNS;
-              ping_info->trans_values.red=ScaleQuantumToShort(p->red)&mask;
-              ping_info->trans_values.green=ScaleQuantumToShort(p->green)&mask;
-              ping_info->trans_values.blue=ScaleQuantumToShort(p->blue)&mask;
-              ping_info->trans_values.gray=
+              ping_info->trans_color.red=ScaleQuantumToShort(p->red)&mask;
+              ping_info->trans_color.green=ScaleQuantumToShort(p->green)&mask;
+              ping_info->trans_color.blue=ScaleQuantumToShort(p->blue)&mask;
+              ping_info->trans_color.gray=
                  (png_uint_16) ScaleQuantumToShort(PixelIntensity(p))&mask;
-              ping_info->trans_values.index=(unsigned char)
+              ping_info->trans_color.index=(unsigned char)
                  (ScaleQuantumToChar(MaxRGB-p->opacity));
             }
           if (ping_info->valid & PNG_INFO_tRNS)
@@ -6413,7 +6414,7 @@
                 {
                   if (p->opacity != OpaqueOpacity)
                     {
-                      if (!RGBColorMatchExact(ping_info->trans_values,*p))
+                      if (!RGBColorMatchExact(ping_info->trans_color,*p))
                       {
                          break;  /* Can't use RGB + tRNS for multiple
                                     transparent colors.  */
@@ -6426,7 +6427,7 @@
                     }
                    else
                     {
-                      if (RGBColorMatchExact(ping_info->trans_values,*p))
+                      if (RGBColorMatchExact(ping_info->trans_color,*p))
                           break; /* Can't use RGB + tRNS when another pixel
                                     having the same RGB samples is
                                     transparent. */
@@ -6444,10 +6445,10 @@
               ping_info->color_type &= 0x03;  /* changes 4 or 6 to 0 or 2 */
               if (image->depth == 8)
                 {
-                  ping_info->trans_values.red&=0xff;
-                  ping_info->trans_values.green&=0xff;
-                  ping_info->trans_values.blue&=0xff;
-                  ping_info->trans_values.gray&=0xff;
+                  ping_info->trans_color.red&=0xff;
+                  ping_info->trans_color.green&=0xff;
+                  ping_info->trans_color.blue&=0xff;
+                  ping_info->trans_color.gray&=0xff;
                 }
             }
         }
@@ -6463,7 +6464,7 @@
           {
             ping_info->color_type=PNG_COLOR_TYPE_GRAY;
             if (save_image_depth == 16 && image->depth == 8)
-              ping_info->trans_values.gray*=0x0101;
+              ping_info->trans_color.gray*=0x0101;
           }
         if (image->depth > QuantumDepth)
           image->depth=QuantumDepth;
@@ -6577,14 +6578,14 @@
               /*
                 Identify which colormap entry is transparent.
               */
-              ping_info->trans=MagickAllocateMemory(unsigned char *,
+              ping_info->trans_alpha=MagickAllocateMemory(unsigned char *,
                   number_colors);
-              if (ping_info->trans == (unsigned char *) NULL)
+              if (ping_info->trans_alpha == (unsigned char *) NULL)
                 ThrowWriterException(ResourceLimitError,
                     MemoryAllocationFailed,image);
               assert(number_colors <= 256);
               for (i=0; i < (long) number_colors; i++)
-                 ping_info->trans[i]=255;
+                 ping_info->trans_alpha[i]=255;
               for (y=0; y < (long) image->rows; y++)
               {
                 register const PixelPacket
@@ -6604,21 +6605,21 @@
 
                       index=indexes[x];
                       assert((unsigned long) index < number_colors);
-                      ping_info->trans[index]=(png_byte) (255-
+                      ping_info->trans_alpha[index]=(png_byte) (255-
                         ScaleQuantumToChar(p->opacity));
                     }
                   p++;
                 }
               }
               for (i=0; i < (long) number_colors; i++)
-                if (ping_info->trans[i] != 255)
+                if (ping_info->trans_alpha[i] != 255)
                   ping_info->num_trans=(unsigned short) (i+1);
               if (ping_info->num_trans == 0)
                 ping_info->valid&=(~PNG_INFO_tRNS);
               if (!(ping_info->valid & PNG_INFO_tRNS))
                 ping_info->num_trans=0;
               if (ping_info->num_trans == 0)
-                MagickFreeMemory(ping_info->trans);
+                MagickFreeMemory(ping_info->trans_alpha);
             }
 
             /*
@@ -6636,10 +6637,10 @@
           image->depth=8;
         if ((save_image_depth == 16) && (image->depth == 8))
           {
-            ping_info->trans_values.red*=0x0101;
-            ping_info->trans_values.green*=0x0101;
-            ping_info->trans_values.blue*=0x0101;
-            ping_info->trans_values.gray*=0x0101;
+            ping_info->trans_color.red*=0x0101;
+            ping_info->trans_color.green*=0x0101;
+            ping_info->trans_color.blue*=0x0101;
+            ping_info->trans_color.gray*=0x0101;
           }
       }
 
@@ -6666,8 +6667,8 @@
                "  Setting up bKGD chunk");
          png_set_bKGD(ping,ping_info,&background);
 
-         ping_info->trans_values.gray=(png_uint_16)(maxval*
-           ping_info->trans_values.gray/MaxRGB);
+         ping_info->trans_color.gray=(png_uint_16)(maxval*
+           ping_info->trans_color.gray/MaxRGB);
       }
     }
   if (logging)
@@ -7174,7 +7175,7 @@
 #endif
   if (ping_info->valid & PNG_INFO_tRNS)
     {
-      MagickFreeMemory(ping_info->trans);
+      MagickFreeMemory(ping_info->trans_alpha);
       ping_info->valid&=(~PNG_INFO_tRNS);
     }
   png_destroy_write_struct(&ping,&ping_info);
