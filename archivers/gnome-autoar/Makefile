PORTNAME=	gnome-autoar
DISTVERSION=	0.5.2
PORTREVISION=	0
CATEGORIES=	archivers
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Glib wrapper around libarchives
WWW=		https://gitlab.gnome.org/GNOME/gnome-autoar

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe gettext-runtime gmake gnome libarchive meson pkgconfig \
		tar:xz vala:build

CPE_VENDOR=	gnome
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

DOCS_MESON_TRUE=	docs
DOCS_BUILD_DEPENDS=	gi-docgen:textproc/py-gi-docgen

.include <bsd.port.mk>
