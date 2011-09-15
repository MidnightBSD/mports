# $MidnightBSD: mports/graphics/svgviewer/Makefile,v 1.4 2010/10/19 20:55:48 laffer1 Exp $

PORTNAME=	svgviewer
PORTVERSION=	0.2.0
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://gnu.ethz.ch/debian/svgviewer/
DISTNAME=	SVGViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SVG Viewer for GNUstep
LICENSE=	gpl2

LIB_DEPENDS+=	svg.1:${PORTSDIR}/graphics/libsvg \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		png.6:${PORTSDIR}/graphics/png

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
