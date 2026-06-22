PORTNAME=	addresses
PORTVERSION=	0.5.0
CATEGORIES=	mail gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	Addresses-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Versatile addressbook for GNUstep
WWW=		https://gap.nongnu.org/addresses/index.html

LICENSE=	lgpl2.1

USES=		gnustep
USE_GNUSTEP=	back base gui build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

# gnustep.mk defaults MAJORVERSION to the first version component (0) and
# LIBVERSION to 0.0.1, but this port installs into Versions/0.5.0/ and
# names shared libs libAddresses.so.0.5.0.  Override both substitutions.
DEFAULT_LIBVERSION=	${PORTVERSION}
PLIST_SUB+=		MAJORVERSION=${PORTVERSION}

.include <bsd.port.mk>
