PORTNAME=	appwrapper
PORTVERSION=	0.1
PORTREVISION=	6
CATEGORIES=	deskutils gnustep
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/AppWrapper%20${PORTVERSION}
DISTNAME=	AppWrapper.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep application wrapper
WWW=		https://appwrapper.sourceforge.net/

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/AppWrapper

post-patch:
	${RMDIR} ${WRKSRC}/AppWrapper.app/ix86/linux-gnu
	${RMDIR} ${WRKSRC}/AppWrapper.app/ix86
	${REINPLACE_CMD} 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/AppWrapper.app/AppWrapper

.include <bsd.port.mk>
