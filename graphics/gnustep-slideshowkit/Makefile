# $MidnightBSD$

PORTNAME=	slideshowkit
PORTVERSION=	0.0.1
PORTREVISION=	20050211
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	SlideShowKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SlideShow Framework
LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Libraries/libSlideShow.so

.include <bsd.port.mk>
