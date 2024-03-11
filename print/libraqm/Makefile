PORTNAME=	libraqm
DISTVERSION=	0.10.1
CATEGORIES=	print
MASTER_SITES=	https://github.com/HOST-Oman/${PORTNAME}/releases/download/v${DISTVERSION}/
DISTNAME=	raqm-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that encapsulates complex text layout logic
WWW=		https://github.com/HOST-Oman/libraqm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libharfbuzz.so:print/harfbuzz \
		libfreetype.so:print/freetype2

USES=		meson pkgconfig python:test tar:xz

USE_LDCONFIG=	yes

NO_TEST=	yes

OPTIONS_DEFINE=		DOCS
DOCS_BUILD_DEPENDS=	gtkdoc-scan:textproc/gtk-doc
DOCS_MESON_TRUE=	docs

.include <bsd.port.mk>
