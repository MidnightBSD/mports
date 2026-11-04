PORTNAME=	uhttpmock
PORTVERSION=	0.11.0
CATEGORIES=	net gnome
MASTER_SITES=	http://tecnocode.co.uk/downloads/uhttpmock/
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP web service mocking library for GNOME
WWW=		https://gitlab.freedesktop.org/pwithnall/uhttpmock

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsoup-3.0.so:devel/libsoup3

USES=		gettext gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	introspection:build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

DOCS_BUILD_DEPENDS=	gtkdocize:textproc/gtk-doc
DOCS_MESON_TRUE=	gtk_doc

.include <bsd.port.mk>
