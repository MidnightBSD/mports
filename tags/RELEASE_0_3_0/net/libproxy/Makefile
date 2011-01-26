#
# $MidnightBSD: mports/net/libproxy/Makefile,v 1.1 2009/03/19 19:20:22 ctriv Exp $
# $FreeBSD: ports/net/libproxy/Makefile,v 1.1 2009/02/27 05:26:27 marcus Exp $
#

PORTNAME=	libproxy
PORTVERSION=	0.2.3
CATEGORIES?=	net devel
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Library that provides automatic proxy configuration management
LICENSE=	lgpl

USE_GMAKE=	yes
USE_GNOME+=	gnomehack
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS?=--without-gnome --without-kde --without-webkit \
		--without-mozjs --without-networkmanager \
		--with-envvar --with-file

PLIST_SUB+=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
