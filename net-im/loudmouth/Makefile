# New ports collection makefile for:	loudmouth
# Date created:				08 July 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/loudmouth/Makefile,v 1.1 2008/06/25 14:33:01 laffer1 Exp $
# $FreeBSD: ports/net-im/loudmouth/Makefile,v 1.42 2008/06/06 13:51:48 edwin Exp $
#

PORTNAME=	loudmouth
PORTVERSION=	1.2.3
CATEGORIES=	net-im gnome
MASTER_SITES=	http://ftp.imendio.com/pub/imendio/loudmouth/src/ \
		${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Jabber client library
LICENSE=	lgpl

LIB_DEPENDS=	idn.16:${PORTSDIR}/dns/libidn

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20
CONFIGURE_ARGS=	--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

OPTIONS=	GNUTLS "Enable SSL (via GnuTLS) support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=		gnutls.26:${PORTSDIR}/security/gnutls
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

.include <bsd.port.post.mk>
