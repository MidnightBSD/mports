--- ./decode_tm6000/decode_tm6000.c.bak	2019-05-03 13:21:14.000000000 -0400
+++ ./decode_tm6000/decode_tm6000.c	2020-09-15 19:05:15.682417000 -0400
@@ -16,7 +16,7 @@
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA 02110-1335 USA.
  */
-#include "../utils/libv4l2util/v4l2_driver.h"
+#include "utils/libv4l2util/v4l2_driver.h"
 #include <stdio.h>
 #include <string.h>
 #include <argp.h>
@@ -57,7 +57,7 @@
 
 //const char args_doc[]="ARG1 ARG2";
 
-static error_t parse_opt (int key, char *arg, struct argp_state *state)
+static int parse_opt (int key, char *arg, struct argp_state *state)
 {
 	switch (key) {
 	case 'a':
