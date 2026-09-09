PORTNAME=	gnome-tetravex
PORTVERSION=	3.38.3
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome tetravex
WWW=		https://wiki.gnome.org/Apps/Tetravex

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool

PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext-tools gnome localbase meson \
		pkgconfig python shebangfix tar:xz vala:build
USE_GNOME=	glib20 gtk30
INSTALLS_ICONS=	yes

SHEBANG_FILES=	build-aux/meson_post_install.py

BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.Tetravex.gschema.xml

.include <bsd.port.mk>
