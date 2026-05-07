--- hotspot/make/bsd/makefiles/gcc.make.orig
+++ hotspot/make/bsd/makefiles/gcc.make
@@ -311,6 +311,7 @@
   WARNINGS_ARE_ERRORS += -Wno-delete-non-virtual-dtor -Wno-deprecated -Wno-format -Wno-dynamic-class-memaccess
   WARNINGS_ARE_ERRORS += -Wno-empty-body
   WARNINGS_ARE_ERRORS += -Wno-format-nonliteral
+  WARNINGS_ARE_ERRORS += -Wno-register
   ifneq "$(shell expr \( $(CC_VER_MAJOR) \>= 6 \))" "0"
     WARNINGS_ARE_ERRORS += -Wno-undefined-bool-conversion -Wno-expansion-to-defined
     WARNINGS_ARE_ERRORS += -Wno-undefined-var-template
@@ -333,6 +334,10 @@
 # This option is added to CFLAGS rather than OPT_CFLAGS
 # so that OPT_CFLAGS overrides get this option too.
 CFLAGS += -fno-strict-aliasing
+CFLAGS += -fno-delete-null-pointer-checks
+ifeq ($(USE_CLANG), true)
+  CFLAGS += -Wno-register
+endif
 
 # The flags to use for an Optimized g++ build
 ifeq ($(OS_VENDOR), Darwin)
@@ -499,7 +504,7 @@
   #AOUT_FLAGS += -Xlinker -export-dynamic
 else
   # Enable linker optimization
-  LFLAGS += -Xlinker -O1
+  LFLAGS += -Xlinker -O1 -Xlinker --undefined-version
 
   # Use $(SONAMEFLAG:SONAME=soname) to specify the intrinsic name of a shared obj
   SONAMEFLAG = -Xlinker -soname=SONAME
