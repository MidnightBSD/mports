# $MidnightBSD$

PORTNAME=	gtamsanalyzer
PORTVERSION=	0.42
CATEGORIES=	science gnustep
MASTER_SITES=	SF/tamsys/gnustep%20tams/GTAMSAnalyzer%2${PORTVERSION}
DISTNAME=	GTAMSAnalyzer.src.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qualitative Research Software for the Free World for GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=	${WRKDIR}/${DISTNAME}/Source

post-patch:	
	${RM} "${WRKSRC}/obj"

.include <bsd.port.mk>
