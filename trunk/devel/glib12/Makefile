# $MidnightBSD$

PORTNAME=	glib
PORTVERSION=	1.2.10
PORTREVISION=	14
CATEGORIES=	devel
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	12

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some useful routines of C programming (previous stable version)

LICENSE=	lgpl

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool pathfix
USE_CSTD=	gnu89
USE_LDCONFIG=	yes

INFO=		glib

post-install:
	cd ${PREFIX}/bin && ${LN} -sf glib-config glib12-config
	cd ${PREFIX}/lib && ${LN} -sf libglib.so.0.10 libglib.so 
	cd ${PREFIX}/lib && ${LN} -sf libgmodule.so.0.10 libgmodule.so
	cd ${PREFIX}/lib && ${LN} -sf libgthread.so.0.10 libgthread.so

.include <bsd.port.mk>
