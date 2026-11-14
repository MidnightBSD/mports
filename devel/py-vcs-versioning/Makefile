PORTNAME=	vcs-versioning
PORTVERSION=	2.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	vcs_versioning-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Blessed package to manage your versions by vcs metadata
WWW=		https://github.com/pypa/setuptools-scm/tree/main/vcs-versioning \
		https://github.com/pypa/setuptools-scm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=26.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=26.2:devel/py-packaging@${PY_FLAVOR}
TEST_DEPENDS=	git:devel/git \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.2,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0,1:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517 allflavors

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
BUILD_RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.1:devel/py-typing-extensions@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1:textproc/py-tomli@${PY_FLAVOR}
.endif

do-test:
	cd ${WRKSRC} && ${SETENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.post.mk>
