# $MidnightBSD$

PORTNAME=	libXt
PORTVERSION=	1.1.5
PORTEPOCH=	1
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Toolkit library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	lib
USE_XORG=	x11 sm ice xproto:both kbproto
CONFIGURE_ARGS=	--disable-specs
USES=		cpe
CPE_PRODUCT=	libxt
CPE_VENDOR=	x

post-patch:
	@${REINPLACE_CMD} 's/test.*-traditional.*;/true;/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
