PORTNAME=	libSM
PORTVERSION=	1.2.4
PORTEPOCH=	1
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session Management library for X11
WWW=		https://www.freedesktop.org/Software/xlibs

LICENSE=	mit

USES=		xorg xorg-cat:lib tar:xz
USE_XORG=	ice xorgproto xtrans

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
