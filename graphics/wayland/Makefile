# Created by: kwm@FreeBSD.org

PORTNAME=	wayland
PORTVERSION=	1.20.0
CATEGORIES=	graphics wayland
MASTER_SITES=	https://wayland.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wayland composite "server"

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2 \
		libffi.so:devel/libffi \
		libepoll-shim.so:devel/libepoll-shim

CFLAGS+=	"-I${LOCALBASE}/include/libepoll-shim"

USES=		cpe gnome meson pkgconfig tar:xz
USE_GNOME=	libxslt:build
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddocumentation=false

NO_TEST=	yes

post-patch:
	${REINPLACE_CMD} -e 's/freebsd/midnightbsd/g'  \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
