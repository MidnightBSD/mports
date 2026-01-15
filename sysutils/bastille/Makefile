PORTNAME=	bastille
DISTVERSION=	1.3.2.251225
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jail automation framework
WWW=		https://bastillebsd.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

RUN_DEPENDS+=	htop:sysutils/htop

USE_GITHUB=	yes
GH_ACCOUNT=	BastilleBSD

NO_ARCH=	yes
NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} \
		-e 's|/usr/local/etc/bastille|${ETCDIR}|g' \
		-e 's|/usr/local|${PREFIX}|g' \
		${WRKSRC}/usr/local/etc/rc.d/bastille

do-install:
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/usr/local/bin/bastille ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/usr/local/etc/bastille/bastille.conf.sample \
		${STAGEDIR}${ETCDIR}/${PORTNAME}.conf.sample
	${INSTALL_SCRIPT} ${WRKSRC}/usr/local/etc/rc.d/bastille \
		${STAGEDIR}${PREFIX}/etc/rc.d
	(cd ${WRKSRC}/usr/local/share/bastille && \
		${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})
	(cd ${WRKSRC}/usr/local/share/man && \
		${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/share/man)

.include <bsd.port.mk>
