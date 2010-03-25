# $MidnightBSD: mports/graphics/svgviewer/Makefile,v 1.1 2010/01/23 19:27:06 laffer1 Exp $

PORTNAME=	svgviewer
PORTVERSION=	0.2.0
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://web.telia.com/~u42308495/alex/
DISTNAME=	SVGViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SVG Viewer for GNUstep
LICENSE=	gpl2

LIB_DEPENDS+=	svg.1:${PORTSDIR}/graphics/libsvg \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
