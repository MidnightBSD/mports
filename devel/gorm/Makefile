PORTNAME=	gorm
DISTVERSIONPREFIX=	gorm-
DISTVERSION=	1_3_1
PORTREVISION=	1
CATEGORIES=	devel gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical Object Relationship Modeller
WWW=		https://www.gnustep.org/experience/Gorm.html

LICENSE=	gpl3

USES=		gnustep
USE_GNUSTEP=	back build gui
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

USE_GITHUB=	yes
GH_ACCOUNT=	gnustep
GH_PROJECT=	apps-gorm

DEFAULT_LIBVERSION=	1.1.0

CPPFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
