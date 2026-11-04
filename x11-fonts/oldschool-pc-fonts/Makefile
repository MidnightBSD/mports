PORTNAME=	oldschool-pc-fonts
PORTVERSION=	1.0
CATEGORIES=	x11-fonts
MASTER_SITES=	http://int10h.org/${PORTNAME}/download/
DISTNAME=	ultimate_oldschool_pc_font_pack_v${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultimate Oldschool PC Font Pack

LICENSE=	CC-BY-SA-4.0
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

USES=		fonts zip
NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	(cd ${WRKSRC}/'Px437 (TrueType - DOS charset)' && \
		${INSTALL_DATA} *.ttf ${FONTSDIR})
	(cd ${WRKSRC}/'PxPlus (TrueType - extended charset)' && \
		${INSTALL_DATA} *.ttf ${FONTSDIR})

.include <bsd.port.mk>
