PORTNAME=	font-awesome
DISTVERSION=	6.1.1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://use.fontawesome.com/releases/v${DISTVERSION}/
DISTNAME=	fontawesome-free-${DISTVERSION}-desktop

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Suite of pictographic icons from Font Awesome (free version)

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		fonts zip

PORTSCOUT=	site:https://github.com/FortAwesome/Font-Awesome/releases

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${FONTSDIR}/Font\ Awesome\ 6\ Brands-Regular-400.otf \
		${FONTSDIR}/Font\ Awesome\ 6\ Free-Regular-400.otf \
		${FONTSDIR}/Font\ Awesome\ 6\ Free-Solid-900.otf

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/otfs/*.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
