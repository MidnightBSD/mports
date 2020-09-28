PORTNAME=	gtk-layer-shell
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3.0
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK+ library for the Wayland layer-shell protocol

LICENSE=	lgpl3 mit
LICENSE_COMB=	multi

BUILD_DEPENDS=	wayland-protocols>=1.16:graphics/wayland-protocols
LIB_DEPENDS=	libwayland-client.so:graphics/wayland

USES=		compiler:c11 gnome meson pkgconfig
USE_GNOME=	gtk30 introspection:build
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	wmww

.include <bsd.port.mk>
