PORTNAME=	libgdata
PORTVERSION=	0.18.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib based implimentation of the GData protocol

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	uhttpmock>0:net/uhttpmock
LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
		libjson-glib-1.0.so:devel/json-glib \
		libp11-kit.so:security/p11-kit \
		libgoa-1.0.so:net/gnome-online-accounts \
		libgcr-base-3.so:security/gcr3 \
		liboauth.so:net/liboauth

USES=		gettext gnome localbase meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 introspection:build libxml2
USE_LDCONFIG=	yes

# magus
NO_TEST=	yes

.include <bsd.port.mk>
