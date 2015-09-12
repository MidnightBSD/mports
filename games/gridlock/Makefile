# $MidnightBSD$

PORTNAME=	gridlock
PORTVERSION=	1.10
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	http://www.dozingcatsoftware.com/Gridlock/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	Gridlock-gnustep-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of grid-based board games for GNUstep

LICENSE=	mit

BROKEN=		does not build with latest gnustep

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Gridlock

post-patch:
	@${REINPLACE_CMD} -e 's|#import <netinet/ip_compat.h>|#import <net/if.h>\n#import <netinet/ip_compat.h>|g' ${WRKSRC}/osdep.h

.include <bsd.port.mk>
