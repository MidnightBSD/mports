PORTNAME=	libSM
PORTVERSION=	1.2.3
PORTEPOCH=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session Management library for X11

LICENSE=	mit

USES=		xorg xorg-cat:lib
USE_XORG=	ice xorgproto xtrans

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
