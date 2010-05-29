# $MidnightBSD: mports/net-im/loudmouth/Makefile,v 1.6 2010/05/08 17:32:11 laffer1 Exp $

PORTNAME=	loudmouth
PORTVERSION=	1.4.3
PORTREVISION=	2
CATEGORIES=	net-im gnome
MASTER_SITES=	http://ftp.imendio.com/pub/imendio/loudmouth/src/ \
		GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library
LICENSE=	lgpl

LIB_DEPENDS=	idn.16:${PORTSDIR}/dns/libidn

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack
CONFIGURE_ARGS=	--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-Wl,-Bsymbolic -L${LOCALBASE}/lib"

OPTIONS=	GNUTLS "Enable SSL (via GnuTLS) support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=		gnutls.40:${PORTSDIR}/security/gnutls
RUN_DEPENDS+=		${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    	${WRKSRC}/loudmouth/lm-ssl-gnutls.c

.include <bsd.port.post.mk>
