PORTNAME=	systempreferences
PORTVERSION=	1.2.0
PORTREVISION=	3
CATEGORIES=	deskutils gnustep
MASTER_SITES=	GNUSTEP/usr-apps
DISTNAME=	SystemPreferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	System Preferences application for GNUstep
WWW=		https://www.gnustep.org/experience/systempreferences.html

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
DEFAULT_LIBVERSION=	1.0.0
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
