# Created by: Kuan-Chung Chiu <buganini@gmail.com>

PORTNAME=	khmeros
PORTVERSION=	5.0
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/khmer/Fonts%20-%20KhmerOS/KhmerOS%20Fonts%205.0-%20LGPL%20Licence
DISTNAME=	All_KhmerOS_5.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Khmer OS fonts

LICENSE=	gpl2

USES=		fonts zip
NO_BUILD=	yes

FONTNAME=	Khmer

post-patch:
	${MV} "${WRKSRC}/KhmerOS .ttf" ${WRKSRC}/KhmerOS.ttf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
