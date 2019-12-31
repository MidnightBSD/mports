# $MidnightBSD$

PORTNAME=	atslog
PORTVERSION=	2.1.1
PORTREVISION=	3
CATEGORIES=	comms
MASTER_SITES=	BERLIOS

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Software for collecting and analyzing calls from different PBX models

LICENSE=	gpl2

OPTIONS_DEFINE=	LIBWRAP WWW WWWGD DOCS
OPTIONS_DEFAULT=	LIBWRAP WWW WWWGF
LIBWRAP_DESC=	Enable TCP wrapper support
WWW_DESC=	Install web interface
WWWGD_DESC=	Graphic reports

GNU_CONFIGURE=	yes
USES=		perl5
USE_RC_SUBR=	${PORTNAME}d
PORTDOCS=	CHANGES ChangeLog DEINSTALL INSTALL LICENSE TODO UPDATING USAGE
SUB_FILES=	pkg-message
CONFIGS=	${PORTNAME}.conf.default ${PORTNAME}.conf.default.rus
CONFIGURE_ARGS+=--localstatedir=/var

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MWWW}
USES+=		php
USE_PHP=	pcre
WANT_PHP_WEB=	yes
PLIST_SUB+=	WWW=""
.if ${PORT_OPTIONS:MWWWGD}
USE_PHP+=	gd
.endif
USE_PHP+=	pgsql
.else
PLIST_SUB+=	WWW="@comment "
.endif

USE_PGSQL=	yes
BUILD_DEPENDS+=	p5-DBD-Pg>=0:${PORTSDIR}/databases/p5-DBD-Pg
RUN_DEPENDS+=	p5-DBD-Pg>=0:${PORTSDIR}/databases/p5-DBD-Pg

.if ! ${PORT_OPTIONS:MLIBWRAP}
CONFIGURE_ARGS+=--disable-libwrap
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|createsqltables.|${DATADIR}/sql/createsqltables.|g' \
	    -e 's|data.sql|${DATADIR}/sql/data.sql|' ${WRKSRC}/data/sql/install-sql.pl

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${USE_RC_SUBR}/${USE_RC_SUBR} ${PREFIX}/bin
.if !exists(${PREFIX}/etc/${PORTNAME}.conf)
	${INSTALL_DATA} ${WRKSRC}/include/${PORTNAME}.conf.default ${PREFIX}/etc/${PORTNAME}.conf
.endif
.for i in ${CONFIGS}
	${INSTALL_DATA} ${WRKSRC}/include/${i} ${PREFIX}/etc/
.endfor
.for i in atslogcleardb.pl atslogdb.pl atslogmaster
	${INSTALL_SCRIPT} ${WRKSRC}/include/${i} ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}/lang
	cd ${WRKSRC}/include && \
	${FIND} lang -type f ! -iregex ".*Makefile" -exec \
		${INSTALL_DATA} "{}" "${DATADIR}/{}" \;
	${MKDIR} ${EXAMPLESDIR}/textlogs
	cd ${WRKSRC}/data && \
	${FIND} textlogs -type f -exec \
		${INSTALL_DATA} "{}" "${EXAMPLESDIR}/{}" \;
	${MKDIR} ${DATADIR}/sql
	cd ${WRKSRC}/data && \
	${FIND} sql -type f -iregex ".*\.sql" -exec \
		${INSTALL_DATA} "{}" "${DATADIR}/{}" \;
	${INSTALL_SCRIPT} ${WRKSRC}/data/sql/install-sql.pl ${DATADIR}/sql
	${MKDIR} ${PREFIX}/libexec/${PORTNAME}
	cd ${WRKSRC}/libexec && \
	${FIND} -E . -type f ! -iregex ".*\.(sh|orig)" -exec \
		${INSTALL_DATA} "{}" "${PREFIX}/libexec/${PORTNAME}/{}" \;
	${INSTALL_SCRIPT} ${WRKSRC}/libexec/genindex.sh ${PREFIX}/libexec/${PORTNAME}/
.if ${PORT_OPTIONS:MWWW}
	${MKDIR} ${PREFIX}/www/${PORTNAME}
	cd ${WRKSRC}/www && \
	${FIND} . -type d ! -empty -exec \
		${MKDIR} "${PREFIX}/www/${PORTNAME}/{}" \; && \
	${FIND} -E . -type f ! -iregex "(.*Makefile|.*\.orig)" -exec \
		${INSTALL_DATA} "{}" "${PREFIX}/www/${PORTNAME}/{}" \;
.if !exists(${PREFIX}/www/${PORTNAME}/include/config.inc.php)
	${INSTALL_DATA} ${WRKSRC}/www/include/config.inc.php.default \
		${PREFIX}/www/${PORTNAME}/include/config.inc.php
.endif
	${CHOWN} -R ${WWWOWN}:${WWWGRP} ${PREFIX}/www/${PORTNAME}
.endif
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
