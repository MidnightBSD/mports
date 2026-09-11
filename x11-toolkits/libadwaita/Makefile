PORTNAME=	libadwaita
PORTVERSION=	1.8.7
PORTREVISION=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Building blocks for modern adaptive GNOME applications
WWW=		https://gitlab.gnome.org/GNOME/libadwaita

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	sassc:textproc/sassc
LIB_DEPENDS=	libappstream.so:devel/appstream \
		libfribidi.so:converters/fribidi \
		libgraphene-1.0.so:graphics/graphene

USES=		display:test gettext-tools gnome meson ninja pkgconfig python:build \
		shebangfix tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf gtk40 introspection:build
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
SHEBANG_FILES=	src/gen-public-types.py

.if !defined(DISPLAY)
TEST_ENV+=	DISPLAY=:${XVFBPORT}
.endif

OPTIONS_DEFINE=	DOCS EXAMPLES

DOCS_BUILD_DEPENDS=	gi-docgen:textproc/py-gi-docgen
DOCS_MESON_TRUE=	documentation

.include <bsd.port.mk>
