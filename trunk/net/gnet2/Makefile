# New ports collection makefile for:   gnet2
# Date created:        7 Nov 2007
# Whom:                Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/gnet2/Makefile,v 1.1 2007/11/08 02:40:56 laffer1 Exp $
#

PORTNAME=	gnet
PORTVERSION=	2.0.7
PORTREVISION=	1
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.gnetlibrary.org/src/
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple network library built upon Glib-2

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.if !defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--with-html-dir=${DOCSDIR}
.else
CONFIGURE_ARGS+=	--without-html-dir
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|GNET_INTERFACE_AGE=1|GNET_INTERFACE_AGE=7|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
