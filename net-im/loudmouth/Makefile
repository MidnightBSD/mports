# $MidnightBSD: mports/net-im/loudmouth/Makefile,v 1.10 2011/05/15 22:04:59 laffer1 Exp $

PORTNAME=	loudmouth
PORTVERSION=	1.4.3
PORTREVISION=	4
CATEGORIES=	net-im gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library
LICENSE=	lgpl

LIB_DEPENDS=	idn.17:${PORTSDIR}/dns/libidn

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack
CONFIGURE_ARGS=	--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-Wl,-Bsymbolic -L${LOCALBASE}/lib"

OPTIONS=	GNUTLS "Enable SSL (via GnuTLS) support" off \
		OPENSSL "Enable SSL (via OpenSSL) support" on

.include <bsd.port.pre.mk>

WITHOUT_GNUTLS=yes
.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=		gnutls.40:${PORTSDIR}/security/gnutls
RUN_DEPENDS+=		${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
.elseif !defined(WITHOUT_OPENSSL)
CONFIGURE_ARGS+=	--with-ssl=openssl
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    	${WRKSRC}/loudmouth/lm-ssl-gnutls.c

.include <bsd.port.post.mk>
