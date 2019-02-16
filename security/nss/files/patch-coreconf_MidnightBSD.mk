--- /dev/null	2019-02-15 20:11:00.000000000 -0500
+++ coreconf/MidnightBSD.mk	2019-02-15 20:13:51.391126000 -0500
@@ -0,0 +1,73 @@
+#
+# This Source Code Form is subject to the terms of the Mozilla Public
+# License, v. 2.0. If a copy of the MPL was not distributed with this
+# file, You can obtain one at http://mozilla.org/MPL/2.0/.
+
+include $(CORE_DEPTH)/coreconf/UNIX.mk
+
+DEFAULT_COMPILER	= $(CC)
+CC			?= gcc
+CCC			= $(CXX)
+RANLIB			= ranlib
+
+CPU_ARCH		= $(OS_TEST)
+ifeq ($(CPU_ARCH),i386)
+CPU_ARCH		= x86
+endif
+ifeq ($(CPU_ARCH),pc98)
+CPU_ARCH		= x86
+endif
+ifeq ($(CPU_ARCH),amd64)
+CPU_ARCH		= x86_64
+endif
+ifneq (,$(filter arm%, $(CPU_ARCH)))
+CPU_ARCH		= arm
+endif
+ifneq (,$(filter powerpc%, $(CPU_ARCH)))
+CPU_ARCH		= ppc
+endif
+
+ifneq (,$(filter %64, $(OS_TEST)))
+USE_64			= 1
+endif
+
+OS_CFLAGS		= $(DSO_CFLAGS) -Wall -Wno-switch -DMIDNIGHTBSD -DHAVE_STRERROR -DHAVE_BSD_FLOCK
+
+DSO_CFLAGS		= -fPIC
+DSO_LDOPTS		= -shared -Wl,-soname -Wl,$(notdir $@)
+
+#
+# The default implementation strategy for MidnightBSD is pthreads.
+#
+ifndef CLASSIC_NSPR
+USE_PTHREADS		= 1
+DEFINES			+= -D_THREAD_SAFE -D_REENTRANT
+OS_LIBS			+= -pthread
+DSO_LDOPTS		+= -pthread
+endif
+
+ARCH			= midnightbsd
+
+MOZ_OBJFORMAT		:= $(shell test -x /usr/bin/objformat && /usr/bin/objformat || echo elf)
+
+ifeq ($(MOZ_OBJFORMAT),elf)
+DLL_SUFFIX		= so
+else
+DLL_SUFFIX		= so.1.0
+endif
+
+ifneq (,$(filter alpha ia64,$(OS_TEST)))
+MKSHLIB			= $(CC) -Wl,-Bsymbolic -lc $(DSO_LDOPTS)
+else
+MKSHLIB			= $(CC) -Wl,-Bsymbolic $(DSO_LDOPTS)
+endif
+ifdef MAPFILE
+	MKSHLIB += -Wl,--version-script,$(MAPFILE)
+endif
+PROCESS_MAP_FILE = grep -v ';-' $< | \
+        sed -e 's,;+,,' -e 's; DATA ;;' -e 's,;;,,' -e 's,;.*,;,' > $@
+
+G++INCLUDES		= -I/usr/include/g++
+
+USE_SYSTEM_ZLIB		= 1
+ZLIB_LIBS		= -lz
