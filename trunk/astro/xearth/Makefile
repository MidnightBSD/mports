# New ports collection makefile for:    xearth
# Date created:         29 October 1994
# Whom:                 piero
#
# $FreeBSD: ports/astro/xearth/Makefile,v 1.33 2005/10/03 22:45:42 simon Exp $
# $MidnightBSD$
#

PORTNAME=	xearth
PORTVERSION=	1.1
CATEGORIES=	astro
MASTER_SITES=	ftp://cag.lcs.mit.edu/pub/tuna/ \
		${MASTER_SITE_XCONTRIB:S/$/:xcontrib/} \
		${MASTER_SITE_LOCAL:S/$/:local/}
MASTER_SITE_SUBDIR=	applications/:xcontrib simon/:local
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:xcontrib,local

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth

USE_IMAKE=	yes

MAN1=		xearth.1

# Copy the list of FreeBSD sites & committers locations
post-install:
	@${MKDIR} ${PREFIX}/lib/X11/xearth
.for marker in freebsd.committers.markers freebsd.submitters.markers freebsd.ftp.markers
	@${INSTALL_DATA} ${FILESDIR}/${marker} ${PREFIX}/lib/X11/xearth
.endfor

.include <bsd.port.mk>
