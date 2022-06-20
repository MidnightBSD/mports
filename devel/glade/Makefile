PORTNAME=	glade
PORTVERSION=	3.38.2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

PATCH_SITES=	https://gitlab.gnome.org/GNOME/${PORTNAME}/-/commit/
PATCHFILES+=	04ba6f96.patch:-p1 \
		61304b2e.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User interface builder for GTK+ 3

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2 =	${WRKSRC}/COPYING.GPL
LICENSE_FILE_lgpl2.1 =	${WRKSRC}/COPYING.LGPL

BUILD_DEPENDS=	itstool:textproc/itstool \
		docbook-xsl>=0:textproc/docbook-xsl \
		xsltproc:textproc/libxslt

CONFLICTS=	glade3-3.*
PORTSCOUT=	limitw:1,even

USES=		compiler:c11 desktop-file-utils gettext gnome \
		localbase:ldflags meson pathfix pkgconfig tar:xz
USE_GNOME=	cairo gtk30 intlhack introspection:build

DOCSDIR=	${PREFIX}/share/doc/gladeui-2

OPTIONS_SUB=		yes
OPTIONS_DEFINE=		GJS PYTHON WEBKIT
OPTIONS_DEFAULT=	GJS PYTHON WEBKIT

GJS_DESC=		GJS (JavaScript) support
GJS_MESON_ENABLED=	gjs
GJS_LIB_DEPENDS=	libgjs.so:lang/gjs

PYTHON_MESON_ENABLED=	python
PYTHON_USES=		python:3.4+
PYTHON_USE=		GNOME=pygobject3

WEBKIT_DESC=		Webkit glade support
WEBKIT_MESON_ENABLED=	webkit2gtk
WEBKIT_LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
			libwebkit2gtk-4.0.so:www/webkit2-gtk3

.include <bsd.port.mk>
