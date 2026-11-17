PORTNAME=	pydyf
PORTVERSION=	0.12.1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level PDF generator based on PDF spec 1.7
WWW=		https://doc.courtbouillon.org/pydyf/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2:devel/py-flit-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flit-core<4:devel/py-flit-core@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pillow>=9:graphics/py-pillow@${PY_FLAVOR}

USES=		ghostscript:test python:3.10+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

TEST_WRKSRC=	${WRKDIR}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}
TEST_ARGS=	--import-mode=importlib ${WRKSRC}/tests

.include <bsd.port.mk>
