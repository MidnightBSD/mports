# $MidnightBSD$

PORTNAME=	gtamsanalyzer
PORTVERSION=	0.42
PORTREVISION=	3
CATEGORIES=	science gnustep
MASTER_SITES=	SF/tamsys/gnustep%20tams/GTAMSAnalyzer%2${PORTVERSION}
DISTNAME=	GTAMSAnalyzer.src.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qualitative Research Software for the Free World for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/${DISTNAME}/Source

post-patch:
	${RM} "${WRKSRC}/obj"
	@${REINPLACE_CMD} '/^GNUSTEP_INSTALLATION_DIR/ s|=|=$$(DESTDIR)|' \
		${WRKSRC}/GNUmakefile

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GTAMSAnalyzer.app/GTAMSAnalyzer

.include <bsd.port.mk>
