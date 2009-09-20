# New ports collection makefile for:	hpijs
# Date created:		1 May 2002
# Whom:			ports@FreeBSD.org
#
# $MidnightBSD: mports/print/libijs/Makefile,v 1.1 2007/09/01 08:16:19 laffer1 Exp $
# $FreeBSD: ports/print/libijs/Makefile,v 1.12 2006/08/15 00:56:23 clsung Exp $
#

PORTNAME=	libijs
PORTVERSION=	0.35
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	http://www.linuxprinting.org/ijs/download/
DISTNAME=	ijs-${PORTVERSION}
DIST_SUBDIR=	ghostscript

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library that supports plugin printer driver for Ghostscript

USE_BZIP2=	yes
USE_GNOME=	gnometarget lthack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes

MAN1=		ijs-config.1

.include <bsd.port.mk>
