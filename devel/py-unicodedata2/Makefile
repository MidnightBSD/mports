PORTNAME=	unicodedata2
PORTVERSION=	18.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI:source \
		https://www.unicode.org/Public/:ucd
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:source \
		18.0.0/ucd/NormalizationTest.txt:ucd \
		18.0.0/ucd/extracted/DerivedName.txt:ucd \
		3.2-Update/NormalizationTest-3.2.0.txt:ucd
DIST_SUBDIR=	unicodedata2-${PORTVERSION}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unicodedata backport updated to the latest Unicode version
WWW=		https://github.com/fonttools/unicodedata2

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-randomly>=0:devel/py-pytest-randomly@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	tests
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

pre-test:
	${MKDIR} ${WRKSRC}/tests/data
	${CP} ${_DISTDIR}/18.0.0/ucd/NormalizationTest.txt ${WRKSRC}/tests/data/NormalizationTest-18.0.0.txt
	${CP} ${_DISTDIR}/18.0.0/ucd/extracted/DerivedName.txt ${WRKSRC}/tests/data/DerivedName-18.0.0.txt
	${CP} ${_DISTDIR}/3.2-Update/NormalizationTest-3.2.0.txt ${WRKSRC}/tests/data/NormalizationTest-3.2.0.txt

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
