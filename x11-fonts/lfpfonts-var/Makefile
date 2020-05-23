PORTNAME=	lfpfonts-var
PORTVERSION=	0.83
CATEGORIES=	x11-fonts
MASTER_SITES=	SF/xfonts/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Variable width fonts from the Linux Font Project

LICENSE=	other

WRKSRC=		${WRKDIR}/lfpfonts-var

NO_BUILD=	yes
USES=		fonts tar:bzip2

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/lfp-var/*.pcf.gz ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
