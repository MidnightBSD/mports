# $MidnightBSD$

PORTNAME=	volumecontrolmenulet
PORTVERSION=	0.4.1
CATEGORIES=	audio gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project VolumeControlMenulet bundle
LICENSE=	bsd3

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	SystemConfig:${SYSTEMCONFIG_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Bundles/VolumeControlMenulet

SYSTEMCONFIG_PORT?=	deskutils/etoile-systemconfig

.include <bsd.port.mk>
