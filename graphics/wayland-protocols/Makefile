PORTNAME=	wayland-protocols
PORTVERSION=	1.32
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

.include <bsd.port.mk>
