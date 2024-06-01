PORTNAME=	gnome-autoar
DISTVERSION=	0.4.3
PORTREVISION=	1
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
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection:build

OPTIONS_DEFINE=	DOCS

DOCS_MESON_TRUE=	gtk_doc
DOCS_BUILD_DEPENDS=	gtk-doc>0:textproc/gtk-doc

.include <bsd.port.mk>
