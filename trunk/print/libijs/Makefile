# $MidnightBSD: mports/print/libijs/Makefile,v 1.2 2009/09/20 02:16:41 laffer1 Exp $

PORTNAME=	libijs
PORTVERSION=	0.35
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	http://www.linuxprinting.org/ijs/download/
DISTNAME=	ijs-${PORTVERSION}
DIST_SUBDIR=	ghostscript

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library that supports plugin printer driver for Ghostscript
LICENSE=	mit

MAKE_JOBS_SAFE=	yes
USE_BZIP2=	yes
USE_GNOME=	gnometarget lthack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes

MAN1=		ijs-config.1

.include <bsd.port.mk>
