# Created by: Emanuel Haupt <ehaupt@FreeBSD.org>

PORTNAME=	twemoji-color-font-ttf
PORTVERSION=	12.0.1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/eosrei/twemoji-color-font/releases/download/v${PORTVERSION}/
DISTNAME=	TwitterColorEmoji-SVGinOT-Linux-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Color emoji font using Twitter Unicode 10

LICENSE=	CC-BY-4.0 mit
LICENSE_COMB=	multi
LICENSE_FILE_CC-BY-4.0=		${WRKSRC}/LICENSE-CC-BY.txt
LICENSE_FILE_mit=		${WRKSRC}/LICENSE-MIT.txt

USES=		fonts

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	${FONTSDIR}/TwitterColorEmoji-SVGinOT.ttf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}/
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}/

.include <bsd.port.mk>
