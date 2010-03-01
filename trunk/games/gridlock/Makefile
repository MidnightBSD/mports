# $MidnightBSD$

PORTNAME=	gridlock
PORTVERSION=	1.10
CATEGORIES=	games gnustep
MASTER_SITES=	http://www.dozingcatsoftware.com/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	Gridlock-gnustep-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of grid-based board games for GNUstep
LICENSE=	mit

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/Gridlock

post-patch:
	@${REINPLACE_CMD} -e 's|#import <netinet/ip_compat.h>|#import <net/if.h>\n#import <netinet/ip_compat.h>|g' ${WRKSRC}/osdep.h

.include <bsd.port.mk>
