# $MidnightBSD$

PORTNAME=	gspdf
PORTVERSION=	0.5
PORTREVISION=	4
CATEGORIES=	print gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GSPdf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Postscript and Pdf Viewer for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
USE_GHOSTSCRIPT=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GSPdf.app/GSPdf

.include <bsd.port.mk>
