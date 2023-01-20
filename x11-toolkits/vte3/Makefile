PORTNAME=	vte
PORTVERSION=	0.64.2
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal widget with improved accessibility and I18N support
WWW=		https://wiki.gnome.org/Apps/Terminal/VTE

LICENSE=	lgpl2.1

BUILD_DEPENDS=	bash:shells/bash
LIB_DEPENDS=	libgnutls.so:security/gnutls \
		libfribidi.so:converters/fribidi \
		libpcre2-8.so:devel/pcre2 \
		libicuuc.so:devel/icu

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lang gettext gnome localbase meson \
		pkgconfig python:3.7+ tar:xz vala:build
USE_LDCONFIG=	yes
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection:build

MESON_ARGS=	-Da11y=true \
		-Dgir=true \
		-Dfribidi=true \
		-Dgtk3=true \
		-Dgtk4=false \
		-Dicu=true \
		-D_systemd=false \
		-Dvapi=true

PLIST_SUB=	VERSION=2.91

BINARY_ALIAS=	python3=${PYTHON_CMD}

.include <bsd.port.mk>
