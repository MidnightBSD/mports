PORTNAME=	lfpfonts-fix
PORTVERSION=	0.82
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/xfonts/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixed width fonts from the Linux Font Project

LICENSE=	unknown

WRKSRC=		${WRKDIR}/lfpfonts-fix

NO_BUILD=	yes
USES=		fonts tar:bzip2

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/lfp-fix/*.pcf.gz ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
