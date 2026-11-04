PORTNAME=	fanwood
DISTVERSION=	g20110526
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serif based on the work of a famous Czech-American type designer

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/Open\ Font\ License.markdown

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	theleagueof
GH_TAGNAME=	cbaaed9

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.otf ${FONTSDIR}

.include <bsd.port.mk>
