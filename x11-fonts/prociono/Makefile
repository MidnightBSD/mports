# Created by: Florian Limberger <flo@snakeoilproductions.net>

PORTNAME=	prociono
DISTVERSION=	g20110526
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Roman serif with blackletter elements

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/Open\ Font\ License.markdown

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	theleagueof
GH_TAGNAME=	f9d9680

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${FONTSDIR}/Prociono.otf

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/Prociono.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
