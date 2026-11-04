PORTNAME=	urwfonts
PORTVERSION=	1.0
PORTREVISION=	8
CATEGORIES=	x11-fonts
MASTER_SITES=	https://download.gimp.org/gimp/fonts/
DISTNAME=	urw-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another font package for X

LICENSE=	unknown

WRKSRC=		${WRKDIR}/URW
NO_BUILD=	yes
USES=		fonts

SUB_FILES=	pkg-message

do-install:
	@${MKDIR} ${FONTSDIR}
.for FILE in Fontmap
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${FONTSDIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/*.pfb ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.afm ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.pfm ${FONTSDIR}

.include <bsd.port.mk>
