PORTNAME=	Andika
DISTVERSION=	6.101
CATEGORIES=	x11-fonts
MASTER_SITES=	https://software.sil.org/downloads/r/andika/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Andika TrueType fonts
WWW=		https://software.sil.org/andika/

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts zip

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

_DOCSLIST=	FONTLOG.txt OFL-FAQ.txt README.txt

do-install:
	@${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/documentation
	(cd ${WRKSRC}/documentation && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/documentation)
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}/documentation/source
	(cd ${WRKSRC} && ${INSTALL_DATA} ${_DOCSLIST} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
