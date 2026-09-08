PORTNAME=	gcr
PORTVERSION=	4.4.0.1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for bits of crypto UI and parsing
WWW=		https://gitlab.gnome.org/GNOME/gcr

# The source tree contains GPL-2.0-or-later project metadata, LGPL-2.0-or-later
# and LGPL-2.1-or-later code, and an MPL-1.1 / GPL / LGPL tri-licensed header.
LICENSE=	gpl2+ lgpl+ lgpl2.1+ MPL11
LICENSE_COMB=	multi

BUILD_DEPENDS=	gpg2:security/gnupg
LIB_DEPENDS=	libsecret-1.so:security/libsecret \
		libp11-kit.so:security/p11-kit \
		libgcrypt.so:security/libgcrypt

USES=		gettext gnome meson pkgconfig python:env tar:xz \
		vala:build
USE_GNOME=	glib20 gtk40 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dsystemd=disabled \
		-Dgtk_doc=false

NO_TEST=	yes

.include <bsd.port.mk>
