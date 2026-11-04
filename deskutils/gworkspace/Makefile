PORTNAME=	gworkspace
PORTVERSION=	1.1.0
CATEGORIES=	deskutils gnustep
MASTER_SITES=	GNUSTEP/usr-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager
WWW=		https://www.gnustep.org/experience/GWorkspace.html

LICENSE=	gpl2+

USES=		gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

GNU_CONFIGURE=	yes
ADDITIONAL_LDFLAGS+=	-L${WRKSRC}/FSNode/FSNode.framework/Versions/A

pre-configure:
	${RM} -rf ${WRKSRC}/GWMetadata

.include <bsd.port.mk>
