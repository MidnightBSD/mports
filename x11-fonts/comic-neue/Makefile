PORTNAME=	comic-neue
PORTVERSION=	2.4
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Comic Sans alternative

LICENSE=	OFL11
LICENSE_FILE=	${WRKDIR}/comicneue-${PORTVERSION}/SIL-License.txt

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	crozynski
GH_PROJECT=	comicneue

NO_BUILD=	yes
WRKSRC_SUBDIR=		OTF

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
