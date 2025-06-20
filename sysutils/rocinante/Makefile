PORTNAME=	rocinante
DISTVERSION=	0.1.20220714
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rocinante is a lightweight configuration management software
WWW=		https://github.com/bastillebsd/rocinante

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	bastillebsd
GH_TAGNAME=	ace6eea

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${LOCALBASE}/bin/rocinante ${PREFIX}/bin

post-install:
	${MKDIR} ${PREFIX}/etc
	${MKDIR} ${PREFIX}/libexec/${PORTNAME}
	(cd ${WRKSRC}/${LOCALBASE}/libexec/${PORTNAME} && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/libexec/${PORTNAME})
	${INSTALL_DATA} ${WRKSRC}${LOCALBASE}/etc/rocinante.conf ${STAGEDIR}${PREFIX}/etc/rocinante.conf.sample

.include <bsd.port.mk>
