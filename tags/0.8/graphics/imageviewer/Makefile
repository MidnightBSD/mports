# $MidnightBSD$

PORTNAME=	imageviewer
PORTVERSION=	0.6.3
PORTREVISION=	2
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://www.nice.ch/~phip/ \
		FREEBSD_LOCAL/dinoex

DISTNAME=	ImageViewer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Image Viewer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/ImageViewer.app/ImageViewer

.include <bsd.port.mk>
