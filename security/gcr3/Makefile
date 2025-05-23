PORTNAME=	gcr
PORTVERSION=	3.40.0
PORTREVISION=	2
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

PATCH_SITES=	https://gitlab.gnome.org/GNOME/${PORTNAME}/-/commit/
PATCHFILES+=	b3ca1d02bb01.patch:-p1 # https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/81

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for bits of crypto UI and parsing
WWW=		https://live.gnome.org/GnomeKeyring

BUILD_DEPENDS=	gpg2:security/gnupg
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libgpg-error.so:security/libgpg-error \
		libp11-kit.so:security/p11-kit \
		libgcrypt.so:security/libgcrypt

CONFLICTS=	gnome-keyring-2.[0-9]*
PORTSCOUT=	limitw:1,even

USE_GNOME=	cairo gtk30 intlhack introspection:build
USES=		desktop-file-utils gettext gmake gnome libtool meson pathfix \
		pkgconfig python shared-mime-info tar:xz vala:build
USE_LDCONFIG=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.crypto.pgp.gschema.xml

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	gtk-doc>0:textproc/gtk-doc
DOCS_MESON_TRUE=	gtk_doc
DOCSDIR=		${PREFIX}/share/gtk-doc/html/

NO_TEST=	yes

.include <bsd.port.mk>
