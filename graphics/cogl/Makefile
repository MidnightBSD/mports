PORTNAME=	cogl
PORTVERSION=	1.22.8
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clutter OpenGL abstraction library
WWW=		https://clutter-project.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	clutter-1.6.[0-9]*

USES=		gettext gl gmake gnome libtool localbase pathfix pkgconfig \
		tar:xz xorg
GNU_CONFIGURE=	yes
USE_GNOME=	cairo gdkpixbuf pango introspection:build
USE_GL=		egl gbm
USE_XORG=	x11 xcomposite xext xdamage xfixes xrandr
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-x \
		--enable-kms-egl-platform=yes \
		--enable-wayland-egl-platform=yes \
		--enable-xlib-egl-platform=yes
INSTALL_TARGET=	install-strip

PLIST_SUB=	LIBVER=20 LIBVERSION=20.4.3

.include <bsd.port.mk>
