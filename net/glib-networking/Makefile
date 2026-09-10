PORTNAME=	glib-networking
PORTVERSION=	2.80.1
CATEGORIES=	net
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network-related giomodules for glib
WWW=		https://gitlab.gnome.org/GNOME/glib-networking

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext gnome localbase meson pkgconfig \
		python:build tar:xz
USE_GNOME=	glib20

BUILD_DEPENDS=	ca_root_nss>=0:security/ca_root_nss \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas
RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas

PORTSCOUT=	limitw:1,even

BINARY_ALIAS=	python3=${PYTHON_VERSION}

OPTIONS_DEFINE=	OPENSSL PROXY
PROXY_DESC=	Proxy configuration support via libproxy
OPTIONS_SUB=	yes
OPTIONS_DEFAULT=	PROXY

OPENSSL_LIB_DEPENDS_OFF=	libgnutls.so:security/gnutls \
				libp11-kit.so:security/p11-kit
OPENSSL_USES=			ssl
OPENSSL_MESON_ENABLED=		openssl
OPENSSL_MESON_DISABLED=		gnutls

PROXY_LIB_DEPENDS=	libdbus-1.so:devel/dbus \
			libproxy.so:net/libproxy
PROXY_MESON_ENABLED=		libproxy
PROXY_MESON_DISABLED=		environment_proxy

post-install:
	${RM} -r ${PREFIX}/lib/systemd

OPENSSL_DESC+=	(instead of GnuTLS)

.include <bsd.port.mk>
