PORTNAME=	blackout
DISTVERSION=	g20140730
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stencil font inspired by filling in sans-serif newspaper headlines

LICENSE=	OFL11
LICENSE_FILE=	"${WRKSRC}/Open Font License.markdown"

USES=		fonts
FONTNAME=	Blackout
USE_GITHUB=	yes
GH_ACCOUNT=	theleagueof
GH_TAGNAME=	4864cfc

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	@${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}
	(cd ${WRKSRC}/webfonts && ${COPYTREE_SHARE} . ${FONTSDIR})

.include <bsd.port.mk>
