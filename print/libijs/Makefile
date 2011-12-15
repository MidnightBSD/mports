# $MidnightBSD: mports/print/libijs/Makefile,v 1.5 2011/09/18 20:51:33 laffer1 Exp $

PORTNAME=	libijs
PORTVERSION=	0.35
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	http://www.openprinting.org/download/ijs/download/
DISTNAME=	ijs-${PORTVERSION}
DIST_SUBDIR=	ghostscript

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library that supports plugin printer driver for Ghostscript
LICENSE=	mit

MAKE_JOBS_SAFE=	yes
USE_BZIP2=	yes
USE_GNOME=	 lthack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

MAN1=		ijs-config.1

.include <bsd.port.mk>
