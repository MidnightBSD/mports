# $MidnightBSD$

PORTNAME=	webfwlog
PORTVERSION=	1.00
CATEGORIES=	security
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based firewall log analyzer

LICENSE=	gpl2

OPTIONS_DEFINE=		MYSQL MYSQLIPV6 PGSQL DOCS
OPTIONS_DEFAULTS=	MYSQL MYSQLIPV6

MYSQLIPV6_DESC=		Shared library plugin for Mysql IPv6 support

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-html-doc-root=${WWWDIR} \
			--enable-syslog \
			--sysconfdir=${ETCDIR} \
			--disable-dependency-tracking

MYSQL_CONFIGURE_WITH=	mysql
PGSQL_CONFIGURE_WITH=	pgsql
MYSQLIPV6_CONFIGURE_ENABLE=	mysql-ipv6

USE_PHP=	session
WANT_PHP_WEB=	yes

PORTDOCS=	AUTHORS COPYING CREDITS ChangeLog INSTALL \
		README ReleaseNotes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMYSQL}
USE_PHP+=	mysqli
USE_MYSQL=	server
MYSQL_PLUGIN_DIR_REL=	lib/mysql/plugin
MYSQL_PLUGIN_DIR=	${LOCALBASE}/${MYSQL_PLUGIN_DIR_REL}
.if ${PORT_OPTIONS:MMYSQLIPV6} && exists (${MYSQL_PLUGIN_DIR})
USES+=	libtool
CONFIGURE_ARGS+=	--libdir=${MYSQL_PLUGIN_DIR}
USE_LDCONFIG=	${MYSQL_PLUGIN_DIR}
PLIST_FILES+=	${MYSQL_PLUGIN_DIR_REL}/libwebfwlog_udf.so
PLIST_FILES+=	${MYSQL_PLUGIN_DIR_REL}/libwebfwlog_udf.so.0
PLIST_FILES+=	${MYSQL_PLUGIN_DIR_REL}/libwebfwlog_udf.so.0.0.0
.endif
.endif

.if ${PORT_OPTIONS:MPGSQL}
USE_PHP+=	pgsql
USES+=	pgsql
WANT_PGSQL=	server client
.endif

SUB_FILES=	pkg-message
SUB_LIST+=	VERSION=${PORTVERSION}

PLIST_SUB+=	WWWGRP=${WWWGRP}

do-install:
	@${MKDIR} ${WWWDIR}/include/
	@${INSTALL_DATA} ${WRKSRC}/webfwlog/style.css ${WWWDIR}
	@${INSTALL_DATA} ${WRKSRC}/webfwlog/index.php ${WWWDIR}
	@(cd ${WRKSRC}/webfwlog/include/ && ${COPYTREE_SHARE} \*.php ${WWWDIR}/include/)
	@${ECHO} "Installed web files in ${WWWDIR}"
	@${MKDIR} ${ETCDIR}
	@${INSTALL_DATA} ${WRKSRC}/webfwlog.conf ${ETCDIR}/webfwlog.conf.sample
	@${ECHO} "Installed ${ETCDIR}/webfwlog.conf"
	@${INSTALL_PROGRAM} ${WRKSRC}/src/wfwl_syslog ${PREFIX}/bin/
	@${ECHO} "Installed ${PREFIX}/bin/wfwl_syslog"
.if ${PORT_OPTIONS:MMYSQLIPV6} && exists (${MYSQL_PLUGIN_DIR})
	@${MKDIR} ${MYSQL_PLUGIN_DIR}
	@(cd ${WRKSRC}/src/mysql && ${MAKE} DESTDIR= install-strip)
	@${ECHO} "Installed mysql shared library in ${MYSQL_PLUGIN_DIR}"
.endif

post-install:
	@${MKDIR} ${DOCSDIR}/mysql
	@${MKDIR} ${DOCSDIR}/pgsql
	@${MKDIR} ${DOCSDIR}/examples
	@(cd ${WRKSRC}/mysql/ && ${COPYTREE_SHARE} \* ${DOCSDIR}/mysql/)
	@(cd ${WRKSRC}/pgsql/ && ${COPYTREE_SHARE} \* ${DOCSDIR}/pgsql/)
	@(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} \* ${DOCSDIR}/examples/)
.for docs in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
