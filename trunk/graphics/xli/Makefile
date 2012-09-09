# $MidnightBSD: mports/graphics/xli/Makefile,v 1.9 2011/08/21 20:39:56 laffer1 Exp $

PORTNAME=	xli
PORTVERSION=	1.17.0
PORTREVISION=	11
CATEGORIES=	graphics
#MASTER_SITES=	${MASTER_SITE_XCONTRIB}
#MASTER_SITE_SUBDIR=	applications
DISTNAME=	xli-2005-09-04

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xli, xsetbg, xview, xlito - utilities to display images on X11
LICENSE=	unknown

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg

FAKE_MAKEARGS+=	DESTDIR=${FAKE_DESTDIR}
USE_XORG=	xi
USE_IMAKE=	yes
MAN1=		xli.1 xlito.1
MLINKS=		xli.1 xview.1 \
		xli.1 xsetbg.1

.include <bsd.port.mk>
