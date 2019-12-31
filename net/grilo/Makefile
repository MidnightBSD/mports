PORTNAME=	grilo
PORTVERSION=	0.3.7
CATEGORIES=	net
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework focused on making media discovery and browsing

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vapigen:lang/vala
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
		liboauth.so:net/liboauth \
		libtotem-plparser.so:multimedia/totem-pl-parser

USES=		gettext gnome localbase meson pathfix pkgconfig \
		python:3.4+,build tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	glib20 intlhack introspection:build libxml2 cairo gdkpixbuf2 gtk30
BINARY_ALIAS=	python=${PYTHON_VERSION}

NO_TEST=	yes

.include <bsd.port.mk>
