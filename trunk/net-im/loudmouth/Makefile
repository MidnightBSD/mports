# $MidnightBSD$

PORTNAME=	loudmouth
PORTVERSION=	1.5.3
CATEGORIES=	net-im gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library

LICENSE=	gpl2

LIB_DEPENDS=	libidn.so:dns/libidn

USES=		gettext gmake libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	glib20
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc --disable-rebuilds \
 		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-Wl,-Bsymbolic -L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=GNUTLS
OPTIONS_RADIO=	SSL
OPTIONS_RADIO_SSL=	GNUTLS OPENSSL

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGNUTLS}
LIB_DEPENDS+=	libgnutls.so:security/gnutls
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
.endif

.if ${PORT_OPTIONS:MOPENSSL}
EXTENSIONS+=	ssl
CONFIGURE_ARGS+=--with-ssl=openssl
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
.endif

.if !${PORT_OPTIONS:MGNUTLS} && !${PORT_OPTIONS:MOPENSSL}
CONFIGURE_ARGS+=--without-ssl
.endif

.include <bsd.port.mk>
