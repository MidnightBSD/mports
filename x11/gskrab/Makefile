# $MidnightBSD$

PORTNAME=	gskrab
PORTVERSION=	0.0.1
CATEGORIES=	x11 gnustep
MASTER_SITES=	http://organact.mine.nu/~wolfgang/gskrab/
DISTNAME=	GSKrab-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Keyboard Grabber

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

ADDITIONAL_LIB_DIRS+=	-L${WRKSRC}/GSKrabFramework/GSKrab.framework/Versions/Current

.include <bsd.port.mk>
