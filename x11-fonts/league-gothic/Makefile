# Created by: Florian Limberger <flo@snakeoilproductions.net>

PORTNAME=	league-gothic
DISTVERSION=	1.601
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Revival of an old classic, Alternate Gothic \#1

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/Open\ Font\ License.markdown

USES=		fonts
USE_GITHUB=	yes
GH_ACCOUNT=	theleagueof
GH_TAGNAME=	e6dce21

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.otf ${FONTSDIR}
.include <bsd.port.mk>
