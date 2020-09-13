PORTNAME=	clearsans
PORTVERSION=	1.00
CATEGORIES=	x11-fonts
MASTER_SITES=	https://01.org/sites/default/files/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Versatile OpenType font for screen, print, and Web

LICENSE=	apache2

USES=		fonts zip
NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC}/TTF && \
		${INSTALL_DATA} *.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
