PORTNAME=	mkbold-mkitalic
PORTVERSION=	0.11
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programs to make BDF font bold/italic
WWW=		https://gitlab.com/unshumikan/mkbold-mkitalic/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

CONFLICTS=	mkbold mkitalic

USE_GITLAB=	yes
GL_ACCOUNT=	unshumikan

PORTDOCS=	ALGORITHM \
		ALGORITHM.eucJP \
		README \
		README.eucJP

PLIST_FILES=	bin/mkbold \
		bin/mkbolditalic \
		bin/mkitalic

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}; ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
