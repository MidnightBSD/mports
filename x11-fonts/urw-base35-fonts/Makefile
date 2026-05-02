PORTNAME=	urw-base35-fonts
DISTVERSION=	20200910
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	URW core35 fonts in various formats
WWW=		https://www.ghostscript.com

LICENSE=	agpl

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	ArtifexSoftware

NO_ARCH=	yes
NO_BUILD=	yes

BUILD_DEPENDS=  fc-cache:x11-fonts/fontconfig
RUN_DEPENDS=    fc-cache:x11-fonts/fontconfig

PLIST_SUB=      FONTSDIR="${FONTSDIR:S|${PREFIX}/||}"

do-install:
	@${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/*.otf ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/*.ttf ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/*.afm ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/fonts/*.t1 ${FONTSDIR}

.include <bsd.port.mk>
