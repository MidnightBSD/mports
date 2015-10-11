# $MidnightBSD$

PORTNAME=	xmppkit
PORTVERSION=	0.4.1
CATEGORIES=	net-im gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project XMPPKit framework
LICENSE=	bsd3

USES=		tar:bzip2 gnustep
USE_GNUSTEP=	back build
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	Addresses:${ADDRESSES_PORT}

DEFAULT_LIBVERSION=	0.1
WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/XMPPKit

FOUNDATION_PORT?=	devel/etoile-foundation
ADDRESSES_PORT?=	mail/addresses

.include <bsd.port.mk>
