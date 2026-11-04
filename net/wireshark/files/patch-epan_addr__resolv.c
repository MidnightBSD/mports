--- epan/addr_resolv.c.orig
+++ epan/addr_resolv.c
@@ -396,7 +396,7 @@ add_ipv6_name(const ws_in6_addr *addr, c
 
 
 static void
-c_ares_ghba_sync_cb(void *arg, int status, int timeouts _U_, struct hostent *he) {
+c_ares_ghba_sync_cb(void *arg, int status, int timeouts _U_, const struct hostent *he) {
     sync_dns_data_t *sdd = (sync_dns_data_t *)arg;
     char **p;
 
@@ -1009,7 +1009,7 @@ ws_init_addr_resolv(void)
 }
 
 static void
-c_ares_ghba_cb(void *arg, int status, int timeouts _U_, struct hostent *he) {
+c_ares_ghba_cb(void *arg, int status, int timeouts _U_, const struct hostent *he) {
     async_dns_queue_msg_t *caqm = (async_dns_queue_msg_t *)arg;
     char **p;
 
@@ -3435,7 +3435,7 @@ host_ipaddr_lookup_init(void)
 #define GHI_TIMEOUT (250 * 1000)
 static void
-c_ares_ghi_cb(void *arg, int status, int timeouts _U_, struct hostent *hp) {
+c_ares_ghi_cb(void *arg, int status, int timeouts _U_, const struct hostent *hp) {
     /*
      * XXX - If we wanted to be really fancy we could cache results here and
      * look them up in get_host_ipaddr* below.
