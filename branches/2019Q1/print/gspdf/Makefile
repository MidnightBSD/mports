# $MidnightBSD$

PORTNAME=	gspdf
PORTVERSION=	0.5
PORTREVISION=	5
CATEGORIES=	print gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GSPdf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Postscript and Pdf Viewer for GNUstep

LICENSE=	gpl2

USES=		ghostscript gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GSPdf.app/GSPdf

.include <bsd.port.mk>
