PORTNAME=	wayland-protocols
PORTVERSION=	1.25
CATEGORIES=	graphics wayland
MASTER_SITES=	https://wayland.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wayland protocols

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	wayland-scanner:graphics/wayland

USES=		meson pkgconfig tar:xz
MESON_ARGS=	-Dtests=false
NO_ARCH=	yes

.include <bsd.port.mk>
