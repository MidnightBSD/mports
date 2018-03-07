--- /dev/null	2013-07-15 22:04:14.000000000 -0400
+++ coreconf/MidnightBSD.mk	2013-07-15 22:06:54.000000000 -0400
@@ -0,0 +1,66 @@
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
+ifneq (,$(filter powerpc%, $(CPU_ARCH)))
+CPU_ARCH		= ppc
+endif
+
+ifneq (,$(filter %64, $(OS_TEST)))
+USE_64			= 1
+endif
+
+OS_CFLAGS		= $(DSO_CFLAGS) -Wall -Wno-switch -DFREEBSD -DHAVE_STRERROR -DHAVE_BSD_FLOCK
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
+ifndef MOZILLA_CLIENT
+DLL_SUFFIX		= so.1
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
