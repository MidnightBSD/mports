PORTNAME=	nucleus
PORTVERSION=	0.77
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/xfonts/OldFiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another font package for X

LICENSE=	unknown

USES=		fonts

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf

WRKSRC=		${WRKDIR}/${PORTNAME}

do-build:
	@cd ${WRKSRC}/src && ./compile

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}/*.gz ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
