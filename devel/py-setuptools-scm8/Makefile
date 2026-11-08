PORTNAME=	setuptools-scm
DISTVERSION=	8.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	8
DISTNAME=	setuptools_scm-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private setuptools-scm 8.1 build provider
WWW=		https://github.com/pypa/setuptools-scm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flake8>=0:devel/py-flake8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pip>=0:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=0:textproc/py-rich@${PY_FLAVOR} \
		git:devel/git

USES=		python:3.8+
USE_PYTHON=	allflavors pep517
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/8

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1:textproc/py-tomli@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1:textproc/py-tomli@${PY_FLAVOR}
.endif
.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} \
		${WRKSRC}/dist/setuptools_scm-${DISTVERSION}-py3-none-any.whl

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${_PRIVATE_DIR}:${PYTHON_SITELIBDIR} \
		${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.post.mk>
