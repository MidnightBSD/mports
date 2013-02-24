# $MidnightBSD: mports/devel/pkgconf/Makefile,v 1.1 2012/09/08 16:32:31 laffer1 Exp $

PORTNAME=	pkgconf
PORTVERSION=	0.8.9
CATEGORIES=	devel
MASTER_SITES=	http://tortois.es/~nenolod/distfiles/ \
		http://files.etoilebsd.net/pkgconf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	pkg-config compatible utility which does not depend on glib
LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkg-config-dir=${PREFIX}/libdata/pkgconfig \
		--with-system-libdir=/usr/lib \
		--with-system-includedir=/usr/include
USE_BZIP2=	yes

CONFLICTS=	pkg-config-*

.include <bsd.port.mk>
