# $MidnightBSD: mports/devel/pkgconf/Makefile,v 1.2 2013/02/24 00:14:48 laffer1 Exp $

PORTNAME=	pkgconf
PORTVERSION=	0.9.2
CATEGORIES=	devel
MASTER_SITES=	http://rabbit.dereferenced.org/~nenolod/distfiles/ \
		http://files.etoilebsd.net/pkgconf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	pkg-config compatible utility which does not depend on glib
LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkg-config-dir=${PREFIX}/libdata/pkgconfig:/usr/libdata/pkgconfig \
		--with-system-libdir=/usr/lib \
		--with-system-includedir=/usr/include
USE_BZIP2=	yes

CONFLICTS_INSTALL=	pkg-config-*

.include <bsd.port.mk>
