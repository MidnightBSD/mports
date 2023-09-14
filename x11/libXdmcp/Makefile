PORTNAME=	libXdmcp
PORTVERSION=	1.1.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Display Manager Control Protocol library
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		cpe xorg xorg-cat:lib
USE_XORG=	xorgproto:both

CPE_VENDOR=	x.org

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
