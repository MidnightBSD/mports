# Created by: Sofian Brabez <sbrabez@gmail.com>

PORTNAME=	setproctitle
PORTVERSION=	1.1.10
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module to customize the process title

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USES=		python
USE_PYTHON=	autoplist concurrent distutils

PORTDOCS=	HISTORY.rst README.rst

OPTIONS_DEFINE=	DOCS

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/setproctitle*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
