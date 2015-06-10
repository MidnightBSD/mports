# $MidnightBSD$

PORTNAME=	volumecontrolmenulet
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	audio gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project VolumeControlMenulet bundle

LICENSE=	bsd3

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	SystemConfig:${SYSTEMCONFIG_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Bundles/VolumeControlMenulet

SYSTEMCONFIG_PORT?=	deskutils/etoile-systemconfig

.include <bsd.port.mk>
