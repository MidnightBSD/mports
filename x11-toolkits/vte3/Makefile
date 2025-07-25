PORTNAME=	vte
PORTVERSION=	0.70.2
PORTREVISION=	4
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3
DIST_SUBDIR=	gnome

PATCH_SITES=	https://gitlab.gnome.org/GNOME/vte/-/commit/
PATCHFILES+=	9b41cd101429.patch:-p1 #https://gitlab.gnome.org/GNOME/vte/-/issues/2618

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal widget with improved accessibility and I18N support
WWW=		https://wiki.gnome.org/Apps/Terminal/VTE

LICENSE=	lgpl2.1

BUILD_DEPENDS=	bash:shells/bash
LIB_DEPENDS=	libpcre2-8.so:devel/pcre2 \
		libicuuc.so:devel/icu

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lang gettext gnome localbase meson \
		pkgconfig python tar:xz vala:build
USE_LDCONFIG=	yes
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build

MESON_ARGS=	-Da11y=true \
		-Dgir=true \
		-Dgtk3=true \
		-Dicu=true \
		-D_systemd=false \
		-Dvapi=true

# shlib version numbers come from gtk3/4 meson options, not from PYTHON_VER
PLIST_SUB=	VERSION=2.91 VER3=3.91

BINARY_ALIAS=	python3=${PYTHON_CMD}

OPTIONS_DEFINE=	FRIBIDI GNUTLS GTK4
OPTIONS_DEFAULT=FRIBIDI GNUTLS GTK4
OPTIONS_SUB=	yes

FRIBIDI_LIB_DEPENDS=	libfribidi.so:converters/fribidi
FRIBIDI_MESON_OFF=	-Dfribidi=false

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_MESON_OFF=	-Dgnutls=false

GTK4_USE=		GNOME=gtk40
GTK4_MESON_ON=		-Dgtk4=true

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == clang
CPP=		${LOCALBASE}/bin/clang-cpp${_LLVM_VERSION}
CC=		${LOCALBASE}/bin/clang${_LLVM_VERSION}
CXX=		${LOCALBASE}/bin/clang++${_LLVM_VERSION}
BUILD_DEPENDS+=	llvm${_LLVM_VERSION}>=0:devel/llvm${_LLVM_VERSION}
.if ${LLVM_DEFAULT} == 10
_LLVM_VERSION=	11
.else
_LLVM_VERSION=	${LLVM_DEFAULT}
.endif
.endif

.include <bsd.port.post.mk>
