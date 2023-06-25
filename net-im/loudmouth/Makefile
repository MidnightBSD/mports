PORTNAME=	loudmouth
DISTVERSION=	1.5.4
CATEGORIES=	net-im
MASTER_SITES=	https://mcabber.com/files/loudmouth/ \
		http://www.lilotux.net/~mikael/mcabber/files/loudmouth/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library
WWW=		https://mcabber.com/

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libidn.so:dns/libidn

USES=		gettext gmake gnome libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	glib20
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--disable-rebuilds \
		--with-compile-warnings=no \
 		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include
CFLAGS+=	-Wno-deprecated-declarations
LDFLAGS+=	-Wl,-Bsymbolic -L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS
OPTIONS_RADIO=	SSL
OPTIONS_RADIO_SSL=	GNUTLS OPENSSL

.include <bsd.mport.options.mk>


GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CONFIGURE_ON=	--with-ssl=gnutls

OPENSSL_USES=		ssl
OPENSSL_CONFIGURE_ON=	--with-ssl=openssl
OPENSSL_RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

.if empty(PORT_OPTIONS:MGNUTLS) && empty(PORT_OPTIONS:MOPENSSL)
CONFIGURE_ARGS+=--without-ssl
.endif

.include <bsd.port.mk>
