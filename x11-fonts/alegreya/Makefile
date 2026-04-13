PORTNAME=	alegreya
PORTVERSION=	2.008
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	Serif typeface originally intended for literature

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	huertatipografica
GH_PROJECT=	Alegreya

NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	cd ${WRKSRC}/fonts/otf && \
		${INSTALL_DATA} *.otf ${FONTSDIR}

.include <bsd.port.mk>
