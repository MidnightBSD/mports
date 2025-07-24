PORTNAME=	cjs
PORTVERSION=	5.4.1
CATEGORIES=	lang gnome
DIST_SUBDIR=	gnome

PATCH_SITES=	https://gitlab.gnome.org/GNOME/gjs/-/commit/
PATCHFILES=	f93880c356108cfdbc8f9ebe318d18f256d7128d.patch:-p1 # https://gitlab.gnome.org/GNOME/gjs/-/issues/514

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JavaScript bindings based on gobject-introspection
WWW=		https://github.com/linuxmint/cjs

LICENSE=		mit lgpl+
LICENSE_COMB=		dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSES/MIT.txt
LICENSE_FILE_lgpl+ =	${WRKSRC}/LICENSES/LGPL-2.0-or-later.txt

LIB_DEPENDS=	libffi.so:devel/libffi \
		libmozjs-78.so:lang/spidermonkey78

USES=		compiler:c++17-lang gettext gnome localbase meson pkgconfig \
		python:build readline shebangfix xorg
USE_GNOME=	cairo gdkpixbuf gtk30 introspection
USE_XORG=	x11 xext
MESON_ARGS=	-Dinstalled_tests=false \
		-Dprofiler=disabled
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

SHEBANG_GLOB=	*.py

PORTSCOUT=	limit:^[0-9.]+$$	# ignore master.mint* tags
NO_TEST=	yes

post-patch:
	${REINPLACE_CMD} -e 's|--warn-error||g' \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
