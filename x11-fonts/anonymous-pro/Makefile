PORTNAME=	anonymous-pro
PORTVERSION=	1.002
CATEGORIES=	x11-fonts
MASTER_SITES=	http://www.marksimonson.com/assets/content/fonts/
DISTNAME=	AnonymousPro-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fixed width sans designed especially for coders
WWW=		https://www.ms-studio.com/FontSales/anonymouspro.html

LICENSE=	OFL11

USES=		fonts zip
NO_BUILD=	yes

SUB_FILES=	pkg-message

WRKSRC=		${WRKDIR}/${DISTNAME}.001

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${DOCSDIR}
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}

.include <bsd.port.mk>
