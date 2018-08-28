# $MidnightBSD$

PORTNAME=	innerspace
PORTVERSION=	0.2.0
PORTREVISION=	4
CATEGORIES=	x11 gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	InnerSpace-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep screensaver

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} \
		${PREFIX}/GNUstep/System/Applications/InnerSpace.app/Resources/NickSpace.InnerSpace/NickSpace \
		${PREFIX}/GNUstep/System/Applications/InnerSpace.app/Resources/Black.InnerSpace/Black \
		${PREFIX}/GNUstep/System/Applications/InnerSpace.app/Resources/Boxes.InnerSpace/Boxes \
		${PREFIX}/GNUstep/System/Applications/InnerSpace.app/InnerSpace

.include <bsd.port.mk>
