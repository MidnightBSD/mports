PORTNAME=	seahorse
PORTVERSION=	41.0
PORTREVISION=	4
CATEGORIES=	security gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME application for managing encryption keys (PGP, SSH)
WWW=		https://wiki.gnome.org/Apps/Seahorse

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gnupg>=2.1.4:security/gnupg \
		itstool:textproc/itstool
LIB_DEPENDS=	libgcr-base-3.so:security/gcr3 \
		libgpgme.so:security/gpgme \
		libhandy-1.so:x11-toolkits/libhandy \
		libpwquality.so:security/libpwquality \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup
RUN_DEPENDS=	gnupg>=2.1.4:security/gnupg

USES=		cpe gettext gnome localbase:ldflags meson pkgconfig \
		python:build tar:xz vala:build xorg
USE_CSTD=	c99
USE_GNOME=	gtk30
GLIB_SCHEMAS=	org.gnome.seahorse.gschema.xml \
		org.gnome.seahorse.manager.gschema.xml \
		org.gnome.seahorse.window.gschema.xml
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
USE_XORG=	sm
CPE_VENDOR=	gnome

MESON_ARGS=	-Dcheck-compatible-gpg=false \
		-Dhkp-support=true \
		-Dkeyservers-support=true \
		-Dpgp-support=true \
		-Dpkcs11-support=true

BINARY_ALIAS=	python3=${PYTHON_CMD}
PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=		AVAHI LDAP
OPTIONS_DEFAULT=	AVAHI LDAP
OPTIONS_SUB=		yes

AVAHI_DESC=	DNS-SD key sharing
LDAP_DESC=	LDAP keyserver support (for gpg)

AVAHI_LIB_DEPENDS=	libavahi-client.so:net/avahi-app
AVAHI_MESON_TRUE=	key-sharing
LDAP_USES=		ldap
LDAP_MESON_TRUE=	ldap-support

.include <bsd.mport.options.mk>

LDFLAGS+=	-fuse-ld=lld
CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
