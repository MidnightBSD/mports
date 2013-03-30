# New ports collection makefile for:   gnet2
# Date created:        7 Nov 2007
# Whom:                Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/gnet2/Makefile,v 1.6 2011/02/02 21:14:15 laffer1 Exp $
#

PORTNAME=	gnet
PORTVERSION=	2.0.8
PORTREVISION=	1
CATEGORIES=	net ipv6
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple network library built upon Glib-2
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack glib20
USE_PKGCONFIG=	build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.if !defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--with-html-dir=${DOCSDIR}
.else
CONFIGURE_ARGS+=	--without-html-dir
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|GNET_INTERFACE_AGE=0|GNET_INTERFACE_AGE=8|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
