PORTNAME=	montserrat
PORTVERSION=	7.200
DISTVERSIONPREFIX=	v
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sans-serif font inspired by the street signs of Montserrat

LICENSE=	OFL11
LICENSE_FILE=	${WRKSRC}/OFL.txt

USES=		fonts

USE_GITHUB=	yes
GH_ACCOUNT=	JulietaUla
GH_PROJECT=	Montserrat

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for docfile in AUTHOR.txt CONTRIBUTORS.txt README.md
	cd ${WRKSRC} && \
		${INSTALL_DATA} ${docfile} ${STAGEDIR}${DOCSDIR}
.endfor
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC}/fonts/otf && \
		${INSTALL_DATA} *.otf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
