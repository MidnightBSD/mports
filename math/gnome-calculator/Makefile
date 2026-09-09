PORTNAME=	gnome-calculator
PORTVERSION=	47.3
CATEGORIES=	math gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME calculator tool
WWW=		https://apps.gnome.org/Calculator/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libmpfr.so:math/mpfr \
		libmpc.so:math/mpc \
		libgee-0.8.so:devel/libgee \
		libsoup-3.0.so:devel/libsoup3

USES=		compiler:c11 gettext gnome localbase:ldflags meson \
		pkgconfig python:build tar:xz vala:build
USE_GNOME=	glib20 gtk40 gtksourceview5 introspection:build libxml2 \
		libadwaita
BINARY_ALIAS=	python3=${PYTHON_VERSION}
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes

MESON_ARGS=	-Ddoc=false

GLIB_SCHEMAS=	org.gnome.calculator.gschema.xml

.include <bsd.port.mk>
