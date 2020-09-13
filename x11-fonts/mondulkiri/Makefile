# Created by: Kuan-Chung Chiu <buganini@gmail.com>

PORTNAME=	mondulkiri
PORTVERSION=	2
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/khmer/Fonts%20-%20Mondulkiri/Mondulkiri%20Unicode%20Fonts%20v2E3s/
DISTNAME=	Mondulkiri_Unicode_fonts_V2E3s

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mondulkiri Khmer fonts

LICENSE=	unknown

USES=		fonts zip
NO_BUILD=	yes

FONTNAME=	Khmer

WRKSRC=		${WRKDIR}/Opentype\ only\ fonts

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
