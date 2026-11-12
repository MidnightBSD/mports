PORTNAME=	mkdocs-get-deps
DISTVERSION=	0.2.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mkdocs_get_deps-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MkDocs extension that lists all dependencies according to a mkdocs.yml
WWW=		https://github.com/oprypin/mkdocs-get-deps

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mergedeep>=1.3.4:devel/py-mergedeep@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=2.2.0:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=5.1:devel/py-pyyaml@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_WRKSRC=	${WRKDIR}/test-suite
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ARGS=	-o addopts=--tb=native

NO_ARCH=	yes

pre-test:
	@${MKDIR} ${TEST_WRKSRC}/tests
	@${CP} -R ${WRKSRC}/tests/. ${TEST_WRKSRC}/tests/
	@${CP} ${WRKSRC}/pyproject.toml ${TEST_WRKSRC}/

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=4.3:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
