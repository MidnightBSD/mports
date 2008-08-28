# New ports collection makefile for:    xearth
# Date created:         29 October 1994
# Whom:                 piero
#
# $FreeBSD: ports/astro/xearth/Makefile,v 1.33 2005/10/03 22:45:42 simon Exp $
# $MidnightBSD: mports/astro/xearth/Makefile,v 1.6 2008/03/12 02:03:51 laffer1 Exp $
#

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

.include <bsd.port.pre.mk>

.if ${OSREL} == "0.1"
BROKEN=	man page does not install on 0.1-RELEASE
.endif

.include <bsd.port.post.mk>
