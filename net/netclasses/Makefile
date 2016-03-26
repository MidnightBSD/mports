# $MidnightBSD$

PORTNAME=	netclasses
PORTVERSION=	1.1.0
PORTREVISION=	0
CATEGORIES=	net gnustep
MASTER_SITES=	http://savannah.nongnu.org/download/gap/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C framework for socket programming with GNUstep

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	base build
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
