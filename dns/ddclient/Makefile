# $MidnightBSD$

PORTNAME=	ddclient
PORTVERSION=	3.8.2
CATEGORIES=	dns
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Update dynamic DNS entries

LICENSE=	gpl2

USES=		tar:bzip2
USE_PERL5_RUN=	yes
NO_BUILD=	yes
USE_RC_SUBR=	${PORTNAME}

OPTIONS_DEFINE=	SSL
OPTIONS_DEFAULT=SSL

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSL}
RUN_DEPENDS+=	ca_root_nss>0:${PORTSDIR}/security/ca_root_nss \
		p5-IO-Socket-SSL>=0:${PORTSDIR}/security/p5-IO-Socket-SSL
.endif

SUB_FILES=	pkg-message ddclient_force
PKGMESSAGE=	${WRKDIR}/pkg-message

PORTDOCS=	COPYING COPYRIGHT Changelog README.cisco README.ssl \
		sample-etc_cron.d_ddclient sample-etc_dhclient-exit-hooks \
		sample-etc_dhcpc_dhcpcd-eth0.exe sample-etc_ppp_ip-up.local

post-patch:
	@${GREP} -lr '/usr' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -e 's|/usr|${PREFIX}|g'
	@${REINPLACE_CMD} \
		-e 's|/tmp|/var/tmp|' \
		-e 's|/var/cache/ddclient|/var/tmp|' \
		-e '/PATH/s|/etc:/usr/local/lib:||' \
		-e 's|/usr.*perl|${PERL}|g' \
		-e 's|/usr/local|${LOCALBASE}|g' \
		-e 's|/etc/ddclient|${PREFIX}/etc|' \
		${WRKSRC}/ddclient

do-install:
	@${INSTALL_DATA} ${WRKSRC}/sample-etc_ddclient.conf ${PREFIX}/etc/ddclient.conf.sample
	@${INSTALL_SCRIPT} ${WRKSRC}/ddclient ${PREFIX}/sbin/
.if ${PORT_OPTIONS:MDOCS}
	@${INSTALL} -d ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

post-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKDIR}/ddclient_force ${PREFIX}/etc/periodic/daily/ddclient_force

.include <bsd.port.mk>
