PORTNAME=	ttf2pt1
PORTVERSION=	3.4.0
CATEGORIES=	chinese print
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-chinese/${PORTVERSION}
DISTNAME=	${PORTNAME}-chinese-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	True Type Font to Postscript Type 1 converter with Chinese maps
WWW=		https://ttf2pt1.sourceforge.net/

RUN_DEPENDS=	ttf2pt1:print/ttf2pt1

USES=		tar:tgz
MAKE_ARGS=	INSTDIR="${PREFIX}"

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/maps
	${INSTALL_DATA} ${WRKSRC}/*.map ${STAGEDIR}${DATADIR}/maps/

.include <bsd.port.mk>
