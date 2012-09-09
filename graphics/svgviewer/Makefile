# $MidnightBSD: mports/graphics/svgviewer/Makefile,v 1.5 2011/09/15 03:35:57 laffer1 Exp $

PORTNAME=	svgviewer
PORTVERSION=	0.2.0
PORTREVISION=	3
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://gnu.ethz.ch/debian/svgviewer/
DISTNAME=	SVGViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SVG Viewer for GNUstep
LICENSE=	gpl2

LIB_DEPENDS+=	svg.1:${PORTSDIR}/graphics/libsvg \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
