PORTNAME=	libXt
DISTVERSION=	1.3.0
PORTEPOCH=	1
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Toolkit library
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe tar:xz xorg xorg-cat:lib
USE_XORG=	x11 sm ice xorgproto
CPE_VENDOR=	x
CPE_PRODUCT=	libxt

CONFIGURE_ARGS=	--disable-specs

INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} 's/test.*-traditional.*;/true;/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
