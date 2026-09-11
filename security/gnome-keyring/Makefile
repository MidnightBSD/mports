PORTNAME=	gnome-keyring
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program that keeps passwords and other secrets
WWW=		https://gitlab.gnome.org/GNOME/gnome-keyring

LICENSE=	gpl2+ lgpl2.1+
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libgpg-error.so:security/libgpg-error \
		libgcr-base-3.so:security/gcr3 \
		libtasn1.so:security/libtasn1 \
		libp11-kit.so:security/p11-kit \
		libgcrypt.so:security/libgcrypt
RUN_DEPENDS=	pinentry-gnome3:security/pinentry-gnome

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 cpe gettext meson gnome localbase \
		pkgconfig tar:xz
USE_GNOME=	cairo glib20 gtk30 libxslt:build
CPE_VENDOR=	gnome
USE_LDCONFIG=	yes
MESON_ARGS=	-Dssh-agent=true \
		-Dlibcap-ng=disabled \
		-Dselinux=disabled \
		-Dsystemd=disabled
GLIB_SCHEMAS=	org.gnome.crypto.cache.gschema.xml
TEST_ENV=	DBUS_SESSION_BUS_ADDRESS=$$DBUS_SESSION_BUS_ADDRESS

SUB_FILES=	pkg-message

.include <bsd.port.mk>
