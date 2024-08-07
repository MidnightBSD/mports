PORTNAME=	nagios-plugins
PORTVERSION=	2.2.1
PORTEPOCH=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	https://www.nagios-plugins.org/download/ \
		FREEBSD_LOCAL/mat/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugins for Nagios

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS_INSTALL=	monitoring-plugins-*

USES=		charsetfix gmake perl5 libtool ssl
USE_SUBMAKE=	yes

OPTIONS_DEFINE=	QSTAT FPING NETSNMP RADIUS MYSQL PGSQL LDAP IPV6 NLS DBI EXTRAOPTS SSH_PORTABLE
OPTIONS_SINGLE=	DNS
OPTIONS_SINGLE_DNS=	DNS_BASE DNS_BINDTOOLS
OPTIONS_DEFAULT=EXTRAOPTS DNS_BASE
OPTIONS_SUB=	yes

QSTAT_DESC=	Game server query support (check_game)
FPING_DESC=	Support for non-flooding fast ping (check_fping)
NETSNMP_DESC=	SNMP support (check_snmp)
RADIUS_DESC=	Radius support (check_radius)
MYSQL_DESC=	MySQL support (check_mysql)
PGSQL_DESC=	PostgreSQL support (check_pgsql)
LDAP_DESC=	OpenLDAP support (check_ldap)
DBI_DESC=	Check database using DBI
EXTRAOPTS_DESC=	Parsing of plugins ini config files for extra options
SSH_PORTABLE_DESC=	Build check_ssh with ports openssh (instead of base)

DNS_DESC=	Configuration of check_dig and check_dns (see help)

DNS_BASE_DESC=	>= 10 means drill for check_dig and no check_dns
DNS_BINDTOOLS_DESC=	Use dig and nslookup from dns/bind-tools

EXTRAOPTS_CONFIGURE_ENABLE=	extra-opts

GNU_CONFIGURE=	yes

NAGIOSUSER?=	nagios
NAGIOSGROUP?=	nagios
NAGIOSDIR?=	/var/spool/nagios

NAGIOSWWWDIR?=	www/nagios
NAGIOSHTMURL?=	/nagios
NAGIOSCGIURL?=	${NAGIOSHTMURL}/cgi-bin

CONFIGURE_ARGS+=--with-nagios-user=${NAGIOSUSER} \
		--with-nagios-group=${NAGIOSGROUP} \
		--with-cgiurl=${NAGIOSCGIURL} \
		--sbindir=${PREFIX}/${NAGIOSWWWDIR}/cgi-bin \
		--libexecdir=${PREFIX}/libexec/nagios \
		--datadir=${PREFIX}/share \
		--sysconfdir=${PREFIX}/etc/nagios \
		--localstatedir=${NAGIOSDIR} \
		--with-perl=${PERL} \
		--prefix=${PREFIX}

# Also, force some commands with their expected paths so that they don't get
# disabled.
CONFIGURE_ARGS+=ac_cv_path_PATH_TO_QMAIL_QSTAT=/var/qmail/bin/qmail-qstat \
		ac_cv_path_PATH_TO_PING=/sbin/ping \
		ac_cv_path_PATH_TO_PING6=/sbin/ping6 \
		--with-ping-command="/sbin/ping -n -t %d -c %d %s" \
		--with-ping6-command="/sbin/ping6 -n -X %d -c %d %s" \
		ac_cv_path_PATH_TO_SUDO=${LOCALBASE}/bin/sudo \
		ac_cv_path_PATH_TO_SMBCLIENT=${LOCALBASE}/bin/smbclient

CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

QSTAT_BUILD_DEPENDS=	qstat:games/qstat
QSTAT_RUN_DEPENDS=	qstat:games/qstat
QSTAT_CONFIGURE_OFF=	ac_cv_path_PATH_TO_QUAKESTAT= \
			ac_cv_path_PATH_TO_QSTAT=

IPV6_CONFIGURE_WITH=	ipv6

FPING_BUILD_DEPENDS=	fping:net/fping
FPING_RUN_DEPENDS=	fping:net/fping
FPING_CONFIGURE_OFF=	ac_cv_path_PATH_TO_FPING= \
			ac_cv_path_PATH_TO_FPING6=

NETSNMP_BUILD_DEPENDS=	snmpcheck:net-mgmt/net-snmp \
		p5-Net-SNMP>=0:net-mgmt/p5-Net-SNMP
NETSNMP_RUN_DEPENDS=	snmpcheck:net-mgmt/net-snmp \
		p5-Net-SNMP>=0:net-mgmt/p5-Net-SNMP
NETSNMP_CONFIGURE_OFF=	ac_cv_path_PATH_TO_SNMPGET= \
			ac_cv_path_PATH_TO_SNMPGETNEXT=

RADIUS_LIB_DEPENDS=	libradiusclient-ng.so:net/radiusclient
RADIUS_CONFIGURE_WITH=	radius

MYSQL_USE=	mysql=yes
MYSQL_CONFIGURE_WITH=	mysql=${LOCALBASE}

PGSQL_USES=	pgsql
PGSQL_CONFIGURE_WITH=	pgsql=${LOCALBASE}

LDAP_USE=	openldap=yes
LDAP_CONFIGURE_WITH=	ldap

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

DBI_LIB_DEPENDS=	libdbi.so:databases/libdbi
DBI_CONFIGURE_WITH=	dbi

DNS_BINDTOOLS_BUILD_DEPENDS=	${LOCALBASE}/bin/dig:dns/bind-tools
DNS_BINDTOOLS_RUN_DEPENDS=	${DNS_BINDTOOLS_BUILD_DEPENDS}
DNS_BINDTOOLS_CONFIGURE_ON=	--with-dig-command=${LOCALBASE}/bin/dig \
				--with-nslookup-command=${LOCALBASE}/bin/nslookup

SSH_PORTABLE_BUILD_DEPENDS=	${LOCALBASE}/bin/ssh:security/openssh-portable
SSH_PORTABLE_RUN_DEPENDS:=	${SSH_PORTABLE_BUILD_DEPENDS}
SSH_PORTABLE_CONFIGURE_ON=	--with-ssh-command=${LOCALBASE}/bin/ssh

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDNS_BASE}
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-dig-to-drill.diff
CONFIGURE_ARGS+=--with-dig-command=/usr/bin/drill \
		ac_cv_path_PATH_TO_NSLOOKUP=
PLIST_SUB+=	CHECK_DNS="@comment "
.else
PLIST_SUB+=	CHECK_DNS=""
.endif

.if !exists(/usr/bin/ssh) && empty(PORT_OPTIONS:MSSH_PORTABLE)
PLIST_SUB+=	SSH="@comment "
.else
PLIST_SUB+=	SSH=""
.endif

post-patch:
.for file in check_by_ssh.c check_disk.c check_http.c check_mrtgtraf.c \
	check_nagios.c check_ntp.c check_ntp_peer.c check_ntp_time.c \
	check_pgsql.c check_snmp.c check_ssh.c check_swap.c check_time.c \
	check_users.c
	@${REINPLACE_CMD} -e 's|setlocale (LC_ALL, "");|setlocale (LC_ALL, ""); setlocale(LC_NUMERIC, "C");|g' ${WRKSRC}/plugins/${file}
.endfor
	@${REINPLACE_CMD} -e 's|chown root|${TRUE}|g' ${WRKSRC}/plugins-root/Makefile.in
	# add a fake PATH so that it gets set to a correct value during build.
	@${REINPLACE_CMD} -e "s|$$ENV{'PATH'}=''|$$ENV{'PATH'}='foo'|; \
		s|/usr/bin/|${LOCALBASE}/bin/|g" \
		${WRKSRC}/plugins-scripts/*.pl

.include <bsd.port.mk>
