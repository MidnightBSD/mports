# $MidnightBSD$
# $FreeBSD: ports/graphics/clutter/Makefile,v 1.17 2011/09/23 22:23:05 amdmi3 Exp $

PORTNAME=	clutter
PORTVERSION=	1.22.4
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL based interactive canvas library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libjson-glib-1.0.so:${PORTSDIR}/devel/json-glib \
		libcogl.so:${PORTSDIR}/graphics/cogl

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gtk30 introspection:build
USE_GL=		gl egl
USE_XORG=	glproto x11 xfixes xdamage xcomposite xi
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-x --enable-conformance=no \
		--enable-egl-backend=yes \
		--enable-x11-backend=yes \
		--enable-gdk-backend=no \
		--enable-wayland-compositor=no
CPPFLAGS+=	-I${LOCALBASE}/include -fno-omit-frame-pointer
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
