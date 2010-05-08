# $MidnightBSD: mports/net-im/loudmouth/Makefile,v 1.5 2009/09/20 01:46:53 laffer1 Exp $

PORTNAME=	loudmouth
PORTVERSION=	1.4.3
PORTREVISION=	1
CATEGORIES=	net-im gnome
MASTER_SITES=	http://ftp.imendio.com/pub/imendio/loudmouth/src/ \
		${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library
LICENSE=	lgpl

LIB_DEPENDS=	idn.16:${PORTSDIR}/dns/libidn

USE_AUTOTOOLS=	libtool:22
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack
CONFIGURE_ARGS=	--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-Wl,-Bsymbolic -L${LOCALBASE}/lib"

OPTIONS=	GNUTLS "Enable SSL (via GnuTLS) support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=		gnutls.40:${PORTSDIR}/security/gnutls
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

.include <bsd.port.post.mk>
