PORTNAME=	comic-neue
PORTVERSION=	2.51
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Comic Sans alternative
WWW=		http://comicneue.com/

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts zip

MASTER_SITES=	http://comicneue.com/

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC}/OTF && ${INSTALL_DATA} ComicNeue-Angular/*.otf ComicNeue/*.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
