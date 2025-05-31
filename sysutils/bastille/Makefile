PORTNAME=	bastille
DISTVERSION=	0.14.20250420
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jail automation framework
WWW=		https://bastillebsd.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

RUN_DEPENDS+=	htop:sysutils/htop

USE_GITHUB=	yes
GH_ACCOUNT=	bastillebsd

NO_ARCH=	yes
NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} \
		-e 's|/usr/local/etc/bastille|${ETCDIR}|g' \
		-e 's|/usr/local|${PREFIX}|g' \
		${WRKSRC}/usr/local/etc/rc.d/bastille

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/usr/local/bin/bastille ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/usr/local/etc/rc.d/bastille \
		${STAGEDIR}${PREFIX}/etc/rc.d

post-install:
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC}/${LOCALBASE}/${DATADIR_REL} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})
	${INSTALL_MAN} ${WRKSRC}/${TRUE_PREFIX}/man/man8/bastille.8.gz \
		${STAGEDIR}${PREFIX}/share/man/man8/bastille.8.gz
	${INSTALL_DATA} ${WRKSRC}/${LOCALBASE}/${ETCDIR_REL}/bastille.conf.sample ${ETCDIR}/bastille.conf.sample

.include <bsd.port.mk>
