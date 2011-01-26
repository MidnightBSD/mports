# $MidnightBSD: mports/graphics/xli/Makefile,v 1.7 2010/05/05 20:42:29 vganji Exp $

PORTNAME=	xli
PORTVERSION=	1.17.0
PORTREVISION=	10
CATEGORIES=	graphics
MASTER_SITES=	http://pantransit.reptiles.org/prog/xli/ \
		${MASTER_SITE_XCONTRIB}
MASTER_SITE_SUBDIR=	applications
DISTNAME=	xli-${XLI_SNAPVER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xli, xsetbg, xview, xlito - utilities to display images on X11
LICENSE=	unknown

LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg

WRKSRC=		${WRKDIR}/xli-${XLI_SNAPVER}
FAKE_MAKEARGS+=	DESTDIR=${FAKE_DESTDIR}
USE_XORG=	xi
USE_IMAKE=	yes
MAN1=		xli.1 xlito.1
MLINKS=		xli.1 xview.1 \
		xli.1 xsetbg.1

XLI_SNAPVER=	2005-09-04

.include <bsd.port.mk>
