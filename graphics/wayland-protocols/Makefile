PORTNAME=	wayland-protocols
PORTVERSION=	1.44
CATEGORIES=	graphics
MASTER_SITES=	https://gitlab.freedesktop.org/wayland/${PORTNAME}/-/releases/${DISTVERSION}/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wayland protocols
WWW=		https://wayland.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	wayland-scanner:graphics/wayland

USES=		meson pkgconfig tar:xz
MESON_ARGS=	-Dtests=false
NO_ARCH=	yes

post-install:
	${MKDIR} ${PREFIX}/share/pkgconfig/
	-${CP} ${PREFIX}/libdata/pkgconfig/wayland-protocols.pc ${PREFIX}/share/pkgconfig/wayland-protocols.pc

.include <bsd.port.mk>
