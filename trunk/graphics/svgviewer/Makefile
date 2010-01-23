# $MidnightBSD$

PORTNAME=	svgviewer
PORTVERSION=	0.2.0
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://web.telia.com/~u42308495/alex/
DISTNAME=	SVGViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SVG Viewer for GNUstep
LICENSE=	gpl2

LIB_DEPENDS+=	svg.1:${PORTSDIR}/graphics/libsvg
LIB_DEPENDS+=	jpeg.10:${PORTSDIR}/graphics/jpeg
LIB_DEPENDS+=	png.5:${PORTSDIR}/graphics/png

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
