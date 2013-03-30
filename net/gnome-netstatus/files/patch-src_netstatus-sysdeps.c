--- src/netstatus-sysdeps.c.orig	2009-03-08 00:25:52.000000000 -0500
+++ src/netstatus-sysdeps.c	2009-03-08 15:24:33.000000000 -0400
@@ -37,13 +37,26 @@
 
 #ifdef __FreeBSD__
 #include <sys/types.h>
+#include <sys/param.h>
 #include <sys/socket.h>
 #include <sys/ioctl.h>
+#include <ifaddrs.h>
 #include <net/if.h>
+#include <net/if_media.h>
 #include <net/if_var.h>
+#if __FreeBSD_version < 700046
 #include <dev/an/if_aironet_ieee.h>
 #include <dev/wi/if_wavelan_ieee.h>
 #endif
+#if __FreeBSD_version >= 602000
+#include <net80211/ieee80211.h>
+#include <net80211/ieee80211_ioctl.h>
+#endif
+#include <stdlib.h>
+#ifndef IEEE80211_ADDR_COPY
+#define IEEE80211_ADDR_COPY(dst, src)   memcpy(dst, src, IEEE80211_ADDR_LEN)
+#endif
+#endif
 
 static inline gboolean
 parse_stats (char    *buf,
@@ -426,15 +439,16 @@ wireless_getval (const char      *iface,
   return TRUE;
 }
 
+#if __FreeBSD_version < 700046
 static inline char *
 get_an_data (const char *iface,
 	     int        *signal_strength)
 {
+  struct an_ltv_status *sts;
+  struct an_req         areq;
 #ifdef AN_RID_RSSI_MAP
   struct an_ltv_rssi_map  an_rssimap;
 #endif
-  struct an_req         areq;
-  struct an_ltv_status *sts;
   int                   level;
   char                 *error = NULL;
   gboolean              rssimap_valid = FALSE;
@@ -486,11 +500,11 @@ get_wi_data (const char *iface,
   level = (int) wreq.wi_val[1];
 
 #ifdef WI_RID_READ_APS
-  if (signal_strength <= 0)
+  if (level <= 0)
     {
       /* we fail to get signal strength by usual means, try another way */
       static time_t   last_scan;
-      static long int cached;
+      static int cached;
       time_t          now;
 
       now = time (NULL);
@@ -510,15 +524,15 @@ get_wi_data (const char *iface,
           if (nstations > 0)
 	    {
               w = (struct wi_apinfo *)(((char *) &wreq.wi_val) + sizeof (int));
-              signal_strength = (long int) w->signal;
+              level = w->signal;
             }
 
-            cached = signal_strength;
+            cached = level;
             last_scan = now;
           }
         else
 	  {
-            signal_strength = cached;
+            level = cached;
           }
     }
 #endif
@@ -527,6 +541,77 @@ get_wi_data (const char *iface,
 
   return error;
 }
+#endif
+
+#if __FreeBSD_version >= 602000
+static inline char *
+get_net80211_data (const char *iface,
+		   int        *signal_strength)
+{
+  struct ieee80211req_sta_info *si;
+  struct ieee80211req           ireq;
+  int                           level;
+  int                           s;
+  uint8_t                       mac[IEEE80211_ADDR_LEN];
+  int8_t                        noise;
+  char                         *error = NULL;
+  union {
+    struct ieee80211req_sta_req info;
+    char buf[1024];
+  } u_info;
+
+  memset (&u_info, 0, sizeof (u_info));
+  memset (&ireq, 0, sizeof (ireq));
+
+  strlcpy (ireq.i_name, iface, sizeof (ireq.i_name));
+  ireq.i_type = IEEE80211_IOC_BSSID;
+  ireq.i_data = mac;
+  ireq.i_len = IEEE80211_ADDR_LEN;
+
+  s = socket (AF_INET, SOCK_DGRAM, 0);
+  if (s == -1)
+    {
+      error = g_strdup_printf (_("Could not connect to interface, '%s'"), iface);
+      return error;
+    }
+
+  if (ioctl (s, SIOCG80211, &ireq) == -1)
+    {
+      error = g_strdup_printf (_("Could not get MAC for interface, '%s'"), iface);
+      close (s);
+      return error;
+    }
+
+  IEEE80211_ADDR_COPY (u_info.info.is_u.macaddr, mac);
+  ireq.i_type = IEEE80211_IOC_STA_INFO;
+  ireq.i_data = (caddr_t) &u_info;
+  ireq.i_len = sizeof (u_info);
+
+  if (ioctl (s, SIOCG80211, &ireq) == -1)
+    {
+      error = g_strdup_printf (_("Could not send ioctl to interface, '%s'"), iface);
+      close (s);
+      return error;
+    }
+
+  close (s);
+
+  si = &u_info.info.info[0];
+  noise = si->isi_noise;
+  if (si->isi_rssi == 0)
+    level = 0;
+  else
+    {
+      if (noise == 0)
+        noise = -95;
+      level = (int) abs (rint ((si->isi_rssi / (si->isi_rssi/2. + noise)) * 100.0));
+      level = CLAMP (level, 0, 100);
+    }
+
+  memcpy (signal_strength, &level, sizeof (signal_strength));
+  return error;
+}
+#endif
 
 char *
 netstatus_sysdeps_read_iface_wireless_details (const char *iface,
@@ -544,25 +629,52 @@ netstatus_sysdeps_read_iface_wireless_de
   if (signal_strength)
     *signal_strength = 0;
 
+#if __FreeBSD_version < 800036
   if (g_ascii_strncasecmp (iface, "an",   2) &&
       g_ascii_strncasecmp (iface, "wi",   2) &&
       g_ascii_strncasecmp (iface, "ath",  3) &&
       g_ascii_strncasecmp (iface, "ndis", 4) &&
+      g_ascii_strncasecmp (iface, "ural", 4) &&
+      g_ascii_strncasecmp (iface, "ral",  3) &&
       g_ascii_strncasecmp (iface, "ipw",  3) &&
       g_ascii_strncasecmp (iface, "iwi",  3) &&
+      g_ascii_strncasecmp (iface, "rum",  3) &&
+      g_ascii_strncasecmp (iface, "ray",  3) &&
       g_ascii_strncasecmp (iface, "acx",  3))
+#else
+  if (g_strncasecmp (iface, "wlan", 4))
+#endif
     return error_message;
 
+#if __FreeBSD_version < 700046
   if (g_ascii_strncasecmp (iface, "an", 2) == 0)
     {
       error_message = get_an_data (iface, signal_strength);
       *is_wireless = TRUE;
     }
+#endif
+#if __FreeBSD_version >= 602000
+#if __FreeBSD_version < 700046
+  else if (g_strncasecmp (iface, "wi", 2) == 0)
+    {
+      error_message = get_wi_data (iface, signal_strength);
+      *is_wireless = TRUE;
+    }
+  else
+#endif
+    {
+      error_message = get_net80211_data (iface, signal_strength);
+      *is_wireless = TRUE;
+    }
+#else
+#if __FreeBSD_version < 700046
   else
     {
       error_message = get_wi_data (iface, signal_strength);
       *is_wireless = TRUE;
     }
+#endif
+#endif
 
   return error_message;
 }
