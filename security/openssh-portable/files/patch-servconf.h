Apply MidnightBSD's configuration defaults.

--- servconf.h.orig
+++ servconf.h
@@ -43,6 +43,13 @@
 #define DEFAULT_AUTH_FAIL_MAX	6	/* Default for MaxAuthTries */
 #define DEFAULT_SESSIONS_MAX	10	/* Default for MaxSessions */
 
+#ifdef USE_PAM
+#define SSHD_DEFAULT_USE_PAM	1
+#define SSHD_DEFAULT_PASSWORD_AUTHENTICATION	0
+#else
+#define SSHD_DEFAULT_USE_PAM	0
+#define SSHD_DEFAULT_PASSWORD_AUTHENTICATION	1
+#endif
 /* Magic name for internal sftp-server */
 #define INTERNAL_SFTP_NAME	"internal-sftp"
 
@@ -166,7 +173,7 @@
 SSHCONF_STRING(pid_file, PidFile, SSHCFG_GLOBAL, SSHCFG_COPY_NONE) \
 SSHCONF_STRING(moduli_file, ModuliFile, SSHCFG_GLOBAL, SSHCFG_COPY_NONE) \
 SSHCONF_INT(login_grace_time, LoginGraceTime, SSHCFG_GLOBAL, NULL, SSHD_DEFAULT_LOGIN_GRACE_TIME, SSHCFG_COPY_NONE) \
-SSHCONF_INT(permit_root_login, PermitRootLogin, SSHCFG_ALL, multistate_permitrootlogin, PERMIT_NO_PASSWD, SSHCFG_COPY_MATCH) \
+SSHCONF_INT(permit_root_login, PermitRootLogin, SSHCFG_ALL, multistate_permitrootlogin, PERMIT_NO, SSHCFG_COPY_MATCH) \
 SSHCONF_INT(ignore_rhosts, IgnoreRhosts, SSHCFG_ALL, multistate_ignore_rhosts, 1, SSHCFG_COPY_MATCH) \
 SSHCONF_INTFLAG(ignore_user_known_hosts, IgnoreUserKnownHosts, SSHCFG_GLOBAL, 0, SSHCFG_COPY_NONE) \
 SSHCONF_INTFLAG(print_motd, PrintMotd, SSHCFG_GLOBAL, 1, SSHCFG_COPY_NONE) \
@@ -190,7 +197,7 @@
 SSHCONF_INT(pubkey_auth_options, PubkeyAuthOptions, SSHCFG_ALL, NULL, 0, SSHCFG_COPY_MATCH) \
 SSHCONF_INTFLAG(pubkey_authentication, PubkeyAuthentication, SSHCFG_ALL, 1, SSHCFG_COPY_MATCH) \
 SSHCONF_STRING(pubkey_accepted_algos, PubkeyAcceptedAlgorithms, SSHCFG_ALL, SSHCFG_COPY_MATCH) \
-SSHCONF_INTFLAG(password_authentication, PasswordAuthentication, SSHCFG_ALL, 1, SSHCFG_COPY_MATCH) \
+SSHCONF_INTFLAG(password_authentication, PasswordAuthentication, SSHCFG_ALL, SSHD_DEFAULT_PASSWORD_AUTHENTICATION, SSHCFG_COPY_MATCH) \
 SSHCONF_INTFLAG(kbd_interactive_authentication, KbdInteractiveAuthentication, SSHCFG_ALL, 1, SSHCFG_COPY_MATCH) \
 SSHCONF_INTFLAG(permit_empty_passwd, PermitEmptyPasswords, SSHCFG_ALL, 0, SSHCFG_COPY_MATCH) \
 SSHCONF_INT(compression, Compression, SSHCFG_GLOBAL, multistate_compression, SSHD_DEFAULT_COMPRESSION, SSHCFG_COPY_NONE) \
@@ -274,7 +281,7 @@
 
 #ifdef USE_PAM
 #define SSHD_CONFIG_ENTRIES_PAM \
-SSHCONF_INTFLAG(use_pam, UsePAM, SSHCFG_GLOBAL, 0, SSHCFG_COPY_NONE) \
+SSHCONF_INTFLAG(use_pam, UsePAM, SSHCFG_GLOBAL, SSHD_DEFAULT_USE_PAM, SSHCFG_COPY_NONE) \
 SSHCONF_STRING(pam_service_name, PAMServiceName, SSHCFG_ALL, SSHCFG_COPY_NONE)
 #else
 #define SSHD_CONFIG_ENTRIES_PAM \
