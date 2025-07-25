PORTNAME=	gnome-online-accounts
PORTVERSION=	3.44.0
PORTREVISION=	3
CATEGORIES=	net
MASTER_SITES=	GNOME

PATCH_SITES=	https://gitlab.gnome.org/GNOME/gnome-online-accounts/-/commit/
PATCHFILES=	b9638e2418408be4906752297e700506766dcf20.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface provider to access the user's online accounts
WWW=		https://wiki.gnome.org/Projects/GnomeOnlineAccounts/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl
LIB_DEPENDS=	libwebkit2gtk-4.0.so:www/webkit2-gtk@40 \
		libjson-glib-1.0.so:devel/json-glib \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup \
		librest-0.7.so:devel/librest \
		libp11-kit.so:security/p11-kit \
		libgck-1.so:security/gcr3

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lib gettext gmake gnome libtool \
		localbase pathfix pkgconfig tar:xz vala:build
USE_GNOME=	cairo gtk30 introspection:build libxml2 libxslt:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-lastfm

GLIB_SCHEMAS=	org.gnome.online-accounts.gschema.xml

CONFIGURE_ARGS+=--disable-kerberos \
		--disable-fedora \
		--disable-gudev

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	TELEPATHY

TELEPATHY_DESC=			Telepathy data provider
TELEPATHY_CONFIGURE_ENABLE=	telepathy
TELEPATHY_LIB_DEPENDS=		libtelepathy-glib.so:net-im/telepathy-glib

# + flickr

.include <bsd.port.mk>
