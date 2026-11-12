PORTNAME=	feedparser
PORTVERSION=	6.0.12
DISTVERSIONPREFIX=	v
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal feed parser written in Python
WWW=		https://github.com/kurtmckee/feedparser

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sgmllib3k>=0:devel/py-sgmllib3k@${PY_FLAVOR}

USES=		cpe python:3.6+ tar:bzip2
CPE_VENDOR=	mark_pilgrim
USE_PYTHON=	autoplist distutils
USE_GITHUB=	yes

GH_ACCOUNT=	kurtmckee

NO_ARCH=	yes

PORTDOCS=	NEWS README.rst

OPTIONS_DEFINE=	DOCS

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

do-test:
	@(cd ${WRKSRC}; ${SETENV} ${TEST_ENV} ${PYTHON_CMD} tests/runtests.py)

.include <bsd.port.mk>
