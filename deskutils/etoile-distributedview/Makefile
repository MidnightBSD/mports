# $MidnightBSD$

PORTNAME=	distributedview
PORTVERSION=	0.2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project DistributedView framework
LICENSE=	bsd2

USES=           gnustep tar:bzip2
USE_GNUSTEP=    back build

USE_GNUSTEP_LOCAL_LIBS+=	EtoileUI:${ETOILE_UI_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/DistributedView

ETOILE_UI_PORT?=	deskutils/etoile-ui

.include <bsd.port.mk>
