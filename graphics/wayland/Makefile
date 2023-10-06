PORTNAME=	wayland
DISTVERSION=	1.22.0
CATEGORIES=	graphics
MASTER_SITES=	https://gitlab.freedesktop.org/${PORTNAME}/${PORTNAME}/-/releases/${DISTVERSION}/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core Wayland window system code and protocol
WWW=		https://wayland.freedesktop.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2 \
		libffi.so:devel/libffi \
		libepoll-shim.so:devel/libepoll-shim

CFLAGS+=	"-I${LOCALBASE}/include/libepoll-shim"

#USE_GCC=	yes

USES=		cpe gnome meson pkgconfig tar:xz
USE_GNOME=	libxslt:build
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddocumentation=false

NO_TEST=	yes

post-patch:
	${REINPLACE_CMD} -e 's/freebsd/midnightbsd/g'  \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
