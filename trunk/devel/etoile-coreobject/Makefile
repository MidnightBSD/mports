# $MidnightBSD$

PORTNAME=	coreobject
PORTVERSION=	0.4.1
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project CoreObject framework
LICENSE=	mit

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileSerialize:${SERIALIZE_PORT}
USE_PGSQL=	yes

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/CoreObject

FOUNDATION_PORT?=	devel/etoile-foundation
SERIALIZE_PORT?=	devel/etoile-serialize

.include <bsd.port.mk>
