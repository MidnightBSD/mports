PORTNAME=	gnome-keyring
PORTVERSION=	40.0
PORTREVISION=	3
CATEGORIES=	security gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program that keeps passwords and other secrets

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	ca_root_nss>=0:security/ca_root_nss \
		docbook-xsl>=0:textproc/docbook-xsl \
		gcr3>=3.5.3:security/gcr3
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libgpg-error.so:security/libgpg-error \
		libgcr-base-3.so:security/gcr3 \
		libtasn1.so:security/libtasn1 \
		libp11-kit.so:security/p11-kit \
		libgcrypt.so:security/libgcrypt
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss \
		pinentry-gnome3:security/pinentry-gnome

PORTSCOUT=	limitw:1,even

USE_GNOME=	cairo gtk30 intlhack libxslt:build
USES=		compiler:c11 cpe gettext gmake gnome libtool localbase \
		pathfix pkgconfig tar:xz
CPE_VENDOR=	gnome
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-pam-dir="${PREFIX}/lib"
INSTALL_TARGET=	install-strip
GLIB_SCHEMAS=	org.gnome.crypto.cache.gschema.xml

SUB_FILES=	pkg-message

.include <bsd.port.mk>
