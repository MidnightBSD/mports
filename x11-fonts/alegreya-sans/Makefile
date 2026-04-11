PORTNAME=	alegreya-sans
DISTVERSIONPREFIX=	v
DISTVERSION=	2.008
PORTEPOCH=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Humanist sans serif font with a calligraphic feeling

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	huertatipografica
GH_PROJECT=	Alegreya-Sans

NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	cd ${WRKSRC}/fonts/otf && \
		${INSTALL_DATA} *.otf ${FONTSDIR}

.include <bsd.port.mk>
