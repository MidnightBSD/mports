PORTNAME=	wmenu
DISTVERSION=	0.2.0
CATEGORIES=	x11 wayland
MASTER_SITES=	https://codeberg.org/adnano/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficient dynamic menu for Wayland
WWW=		https://codeberg.org/adnano/wmenu/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	scdoc:textproc/scdoc \
		wayland-protocols>0:graphics/wayland-protocols
LIB_DEPENDS=	libepoll-shim.so:devel/libepoll-shim \
		libwayland-client.so:graphics/wayland \
		libxkbcommon.so:x11/libxkbcommon

USES=		compiler:c11 gnome meson pkgconfig
USE_GNOME=	cairo pango

# wayland-client pulls in epoll-shim's headers, so link the library too
LDFLAGS+=	`pkg-config --libs epoll-shim`

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/wmenu \
		bin/wmenu-run \
		share/man/man1/wmenu.1.gz

.include <bsd.port.mk>
