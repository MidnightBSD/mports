PORTNAME=	libxkbcommon
PORTVERSION=	0.10.0
CATEGORIES=	x11
MASTER_SITES=	https://xkbcommon.org/download/
DIST_SUBDIR=	xorg/lib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keymap handling library for toolkits and window systems

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	xkeyboard-config>0:x11/xkeyboard-config

USES=		bison meson pkgconfig tar:xz xorg
USE_XORG=	xcb
MESON_ARGS=	-Denable-docs=false \
		-Denable-wayland=false \
		-Dx-locale-root="${PREFIX}/lib/X11/locale"

.include <bsd.port.pre.mk>

MESON_ARGS+=	-Ddefault-rules=xorg

.include <bsd.port.post.mk>
