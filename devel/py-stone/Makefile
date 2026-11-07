PORTNAME=	stone
PORTVERSION=	3.5.5
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface description language (IDL) for APIs
WWW=		https://github.com/dropbox/stone

LICENSE=	mit bsd3
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE
LICENSE_FILE_bsd3=	${WRKSRC}/stone/_vendor/ply/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=10.2.1<11:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=3.1.6:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=26.3:devel/py-packaging@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=7.16.0:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.1.1,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

PYTHON_TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}

do-test:
	cd ${WRKSRC} && ${SETENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m pytest -v -rs

.include <bsd.port.mk>
