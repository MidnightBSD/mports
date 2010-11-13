# New ports collection makefile for:	libconfuse
# Date created:				18 September 2004
# Whom:					Juraj Lutter <otis@sk.freebsd.org>
#
# $MidnightBSD: mports/devel/libconfuse/Makefile,v 1.3 2009/09/20 00:32:27 laffer1 Exp $
# $FreeBSD: ports/devel/libconfuse/Makefile,v 1.7 2008/04/25 12:50:35 garga Exp $
#

PORTNAME=	libconfuse
PORTVERSION=	2.7
CATEGORIES=	devel
MASTER_SITES=	SAVANNAH
MASTER_SITE_SUBDIR=	confuse
DISTNAME=	confuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration file parsing library
LICENSE=	mit

.if defined(WITH_CHECK)
LIB_DEPENDS+=	${LOCALBASE}/lib/libcheck.a:${PORTSDIR}/devel/libcheck
.endif

USE_ICONV=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig
CONFIGURE_ARGS+=	--disable-nls
CFLAGS+=	-I${WRKSRC}/src
.if defined(WITH_CHECK)
CONFIGURE_ARGS+=	--with-check=${LOCALBASE}
CFLAGS+=	-I${LOCALBASE}/include
.endif

.include <bsd.port.mk>
