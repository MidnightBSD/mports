PORTNAME=	libnotify
DISTVERSION=	0.8.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for desktop notifications
WWW=		https://gitlab.gnome.org/GNOME/libnotify

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake gnome libtool meson pkgconfig tar:xz
USE_GNOME=	gdkpixbuf glib20 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Ddocbook_docs=disabled \
		-Dgtk_doc=false \
		-Dtests=false

OPTIONS_DEFINE=		MANPAGES
OPTIONS_DEFAULT=	MANPAGES
OPTIONS_SUB=		yes

MANPAGES_BUILD_DEPENDS=	docbook-xsl-ns>=0:textproc/docbook-xsl-ns
MANPAGES_USE=		GNOME=libxslt:build
MANPAGES_MESON_TRUE=	man

.include <bsd.port.mk>
