--- src/efivar.c.orig	2014-10-15 09:48:49.000000000 -0400
+++ src/efivar.c	2026-01-06 00:10:29.213477000 -0500
@@ -16,15 +16,16 @@
  * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <ctype.h>
 #include <fcntl.h>
 #include <popt.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/endian.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
+#include <ctype.h>
 
 #include "efivar.h"
 #include "guid.h"
@@ -53,7 +54,7 @@
 	int rc;
 	while ((rc = efi_get_next_variable_name(&guid, &name)) > 0)
 		 printf(GUID_FORMAT "-%s\n",
-			guid->a, guid->b, guid->c, bswap_16(guid->d),
+			guid->a, guid->b, guid->c, bswap16(guid->d),
 			guid->e[0], guid->e[1], guid->e[2], guid->e[3],
 			guid->e[4], guid->e[5], name);
 
@@ -142,7 +143,7 @@
 	}
 
 	printf("GUID: "GUID_FORMAT "\n",
-			guid.a, guid.b, guid.c, bswap_16(guid.d),
+			guid.a, guid.b, guid.c, bswap16(guid.d),
 			guid.e[0], guid.e[1], guid.e[2], guid.e[3],
 			guid.e[4], guid.e[5]);
 	printf("Name: \"%s\"\n", name);
@@ -240,7 +241,7 @@
 		goto err;
 
 	buflen = statbuf.st_size;
-	buf = mmap(NULL, buflen, PROT_READ, MAP_PRIVATE|MAP_POPULATE, fd, 0);
+	buf = mmap(NULL, buflen, PROT_READ, MAP_PRIVATE, fd, 0);
 	if (!buf)
 		goto err;
 
@@ -338,7 +339,7 @@
 			{
 				printf("{"GUID_FORMAT"} {%s} %s %s\n",
 					guid->guid.a, guid->guid.b,
-					guid->guid.c, bswap_16(guid->guid.d),
+					guid->guid.c, bswap16(guid->guid.d),
 					guid->guid.e[0], guid->guid.e[1],
 					guid->guid.e[2], guid->guid.e[3],
 					guid->guid.e[4], guid->guid.e[5],
