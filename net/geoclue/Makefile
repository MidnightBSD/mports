PORTNAME=	geoclue
DISTVERSION=	2.7.2
CATEGORIES=	net devel gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus service that provides location information
WWW=		https://gitlab.freedesktop.org/geoclue/geoclue/wikis/home

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libinotify.so:devel/libinotify \
		libsoup-3.0.so:devel/libsoup3

USES=		gettext gnome meson pkgconfig tar:bz2 vala:build

USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org

MESON_ARGS=	-D3g-source=false \
		-Dcdma-source=false \
		-Dnmea-source=false \
		-Dmodem-gps-source=false

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	DEMO DOCS
OPTIONS_DEFAULT=	DEMO

DEMO_DESC=		Install geoclue (demo) agent
DEMO_LIB_DEPENDS=	libnotify.so:devel/libnotify
DEMO_MESON_TRUE=	demo-agent

DOCS_BUILD_DEPENDS=	gtkdoc-scan:textproc/gtk-doc
DOCS_MESON_TRUE=	gtk-doc

.include <bsd.port.mk>
