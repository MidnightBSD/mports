PORTNAME=	ydiff
DISTVERSION=	1.2
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	FREEBSD_LOCAL/mat/ydiff

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff readability enhancher for color terminals

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_GITHUB=
GH_ACCOUNT=	ymattw
USE_PYTHON=	autoplist concurrent distutils noflavors

NO_ARCH=	yes

PORTDOCS=	CHANGES.rst README.rst

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${INSTALL} -d ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
