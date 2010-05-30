# $MidnightBSD$

PORTNAME=	slideshow
PORTVERSION=	0.3.5
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	SlideShow-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SlideShow Viewer
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	SlideShow:${SLIDESHOWKIT_PORT}

SLIDESHOWKIT_PORT?=	graphics/gnustep-slideshowkit

.include <bsd.port.mk>
