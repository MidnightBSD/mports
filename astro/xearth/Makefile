# $MidnightBSD: mports/astro/xearth/Makefile,v 1.7 2008/05/21 06:10:53 laffer1 Exp $

PORTNAME=	xearth
PORTVERSION=	1.1
CATEGORIES=	astro geography
MASTER_SITES=	ftp://cag.lcs.mit.edu/pub/tuna/ \
		${MASTER_SITE_XCONTRIB:S/$/:xcontrib/} \
		${MASTER_SITE_FREEBSD_LOCAL:S/$/:local/}
MASTER_SITE_SUBDIR=	applications/:xcontrib simon/:local
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:xcontrib,local

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth
LICENSE=	restricted
#patents?

USE_XORG=	x11 xext sm ice xt
USE_IMAKE=	yes

MAN1=		xearth.1

.include <bsd.port.mk>
