PORTNAME=	gnome-calculator
PORTVERSION=	3.38.2
PORTREVISION=	1
CATEGORIES=	math gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME calculator tool
WWW=		https://live.gnome.org/Gcalctool

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libmpfr.so:math/mpfr \
		libmpc.so:math/mpc \
		libsoup-2.4.so:devel/libsoup \
		libgee-0.8.so:devel/libgee

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome localbase:ldflags meson \
		pkgconfig python:build tar:xz vala:build
USE_GNOME=	gtksourceview4 libxml2
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.calculator.gschema.xml

NO_TEST=	yes

.include <bsd.port.mk>
