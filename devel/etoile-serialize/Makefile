# $MidnightBSD: mports/devel/etoile-serialize/Makefile,v 1.1 2010/05/30 23:18:33 laffer1 Exp $

PORTNAME=	serialize
PORTVERSION=	0.4.1
CATEGORIES=	devel gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project EtoileSerialize framework
LICENSE=	bsd2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/EtoileSerialize

FOUNDATION_PORT?=	devel/etoile-foundation

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make

.include <bsd.port.mk>
