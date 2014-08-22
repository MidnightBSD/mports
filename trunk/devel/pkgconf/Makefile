# $MidnightBSD$

PORTNAME=	pkgconf
PORTVERSION=	0.9.6
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://rabbit.dereferenced.org/~nenolod/distfiles/ \
		http://files.etoilebsd.net/pkgconf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to help to configure compiler and linker flags

LICENSE=	iscl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkg-config-dir=${PREFIX}/libdata/pkgconfig:/usr/libdata/pkgconfig \
		--with-system-libdir=/usr/lib \
		--with-system-includedir=/usr/include
USES=		tar:bzip2

CONFLICTS_INSTALL=	pkg-config-*

.include <bsd.port.mk>
