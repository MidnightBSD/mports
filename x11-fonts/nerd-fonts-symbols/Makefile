PORTNAME=	nerd-fonts-symbols
DISTVERSION=	3.4.0
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/ryanoasis/nerd-fonts/releases/download/v${DISTVERSION}/
DISTNAME=	NerdFontsSymbolsOnly
DIST_SUBDIR=	nerd-fonts/${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Symbols Nerd Font
WWW=		https://www.nerdfonts.com

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		fonts tar:xz
FONTNAME=	nerd-fonts/Symbols

NO_ARCH=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

PLIST_FILES=	${FONTSDIR}/SymbolsNerdFont-Regular.ttf \
		${FONTSDIR}/SymbolsNerdFontMono-Regular.ttf

do-install:
	${MKDIR} ${FONTSDIR}
	(cd ${WRKSRC} && \
		${COPYTREE_SHARE} . ${FONTSDIR} '-regex .*\.ttf')

.include <bsd.port.mk>
