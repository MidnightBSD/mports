PORTNAME=	libadwaita
PORTVERSION=	1.4.0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Building blocks for modern GNOME applications
WWW=		https://www.gtk.org/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	sassc:textproc/sassc
LIB_DEPENDS=	libappstream.so:devel/appstream \
		libfribidi.so:converters/fribidi \
		libgraphene-1.0.so:graphics/graphene

USES=		gettext gnome meson ninja pkgconfig tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf gtk40 introspection:build

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	gi-docgen:textproc/py-gi-docgen
DOCS_MESON_TRUE=	gtk_doc

NO_TEST=	yes

.include <bsd.port.mk>
