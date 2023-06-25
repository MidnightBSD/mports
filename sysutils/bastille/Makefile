PORTNAME=	bastille
PORTVERSION=	0.9.20220714
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jail automation framework
WWW=		https://bastillebsd.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	bastillebsd
GH_TAGNAME=	da377f4

NO_BUILD=	yes
NO_ARCH=	yes

USE_RC_SUBR=	bastille

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${TRUE_PREFIX}/bin/bastille ${PREFIX}/bin

post-install:
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC}/${LOCALBASE}/${DATADIR_REL} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})
	${INSTALL_MAN} ${WRKSRC}/${TRUE_PREFIX}/man/man8/bastille.8.gz \
		${STAGEDIR}${PREFIX}/man/man8/bastille.8.gz
	${INSTALL_DATA} ${WRKSRC}/${LOCALBASE}/${ETCDIR_REL}/bastille.conf.sample ${ETCDIR}/bastille.conf.sample

.include <bsd.port.mk>
