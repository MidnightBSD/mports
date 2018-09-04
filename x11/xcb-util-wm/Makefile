# $MidnightBSD$
# $FreeBSD: ports/x11/xcb-util-wm/Makefile,v 1.1 2012/01/15 12:46:11 garga Exp $

PORTNAME=	xcb-util-wm
PORTVERSION=	0.4.1
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for window manager implementation

LICENSE=	mit

LIB_DEPENDS=	xcb-util:${PORTSDIR}/x11/xcb-util

USES=		gmake pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_XORG=	xcb xorg-macros
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
