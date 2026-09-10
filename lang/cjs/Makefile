PORTNAME=	cjs
PORTVERSION=	128.1
CATEGORIES=	lang gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JavaScript bindings based on gobject-introspection
WWW=		https://github.com/linuxmint/cjs

LICENSE=		mit lgpl+
LICENSE_COMB=		dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSES/MIT.txt
LICENSE_FILE_lgpl+ =	${WRKSRC}/LICENSES/LGPL-2.0-or-later.txt

LIB_DEPENDS=	libffi.so:devel/libffi \
		libmozjs-128.so:lang/spidermonkey128
TEST_DEPENDS=	dbus-run-session:devel/dbus \
		gtk3>0:x11-toolkits/gtk30 \
		gtk4>0:x11-toolkits/gtk40

USES=		compiler:c++17-lang display:test gettext gnome meson pkgconfig \
		python:build shebangfix xorg
USE_GNOME=	cairo glib20 introspection
USE_XORG=	x11 xext
MESON_ARGS=	-Dinstalled_tests=false \
		-Dprofiler=disabled \
		-Dc_link_args=-L${WRKSRC}/${MESON_BUILD_DIR}
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

SHEBANG_GLOB=	*.py

PORTSCOUT=	limit:^[0-9.]+$$	# ignore master.mint* tags

.if !defined(DISPLAY)
TEST_ENV+=	DISPLAY=:${XVFBPORT}
.endif

OPTIONS_DEFINE=		READLINE
OPTIONS_DEFAULT=	READLINE

READLINE_MESON_ENABLED=	readline
READLINE_USES=		readline

.include <bsd.port.mk>
