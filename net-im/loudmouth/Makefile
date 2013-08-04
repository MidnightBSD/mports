# $MidnightBSD: mports/net-im/loudmouth/Makefile,v 1.12 2013/03/09 23:30:31 laffer1 Exp $

PORTNAME=	loudmouth
PORTVERSION=	1.4.3
PORTREVISION=	5
CATEGORIES=	net-im gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library

LICENSE=	lgpl

LIB_DEPENDS=	idn:${PORTSDIR}/dns/libidn

USES=		pkgconfig gettext
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack
CONFIGURE_ARGS=	--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-Wl,-Bsymbolic -L${LOCALBASE}/lib

OPTIONS_DEFAULT=GNUTLS
OPTIONS_RADIO=	SSL
OPTIONS_RADIO_SSL=	GNUTLS OPENSSL

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGNUTLS}
LIB_DEPENDS+=	gnutls:${PORTSDIR}/security/gnutls
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
.endif

.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=	yes
CONFIGURE_ARGS+=--with-ssl=openssl
RUN_DEPENDS+=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
.endif

.if !${PORT_OPTIONS:MGNUTLS} && !${PORT_OPTIONS:MOPENSSL}
CONFIGURE_ARGS+=--without-ssl
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    	${WRKSRC}/loudmouth/lm-ssl-gnutls.c

.include <bsd.port.mk>
