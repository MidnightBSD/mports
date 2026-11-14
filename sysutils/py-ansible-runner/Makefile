PORTNAME=	ansible-runner
DISTVERSION=	2.4.3
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	ansible_runner-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensible embeddable ansible job runner
WWW=		https://ansible-runner.readthedocs.io/

LICENSE=	Apache-2.0

BROKEN_armv6=	fails to build: Child process terminated abnormally: Segmentation fault
BROKEN_armv7=	fails to build: Child process terminated abnormally: Segmentation fault

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45<=70.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm8>=6.2<=8.1.0:devel/py-setuptools-scm8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ansible>2.0:sysutils/ansible@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}daemon>0:devel/py-daemon@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pexpect>=4.5:misc/py-pexpect@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}
TEST_DEPENDS=	bash:shells/bash \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=0:devel/py-pytest-timeout@${PY_FLAVOR}
USES=		cpe python:3.9+
CPE_VENDOR=	redhat
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

SCM8_BUILD_PATH?=	${PYTHONPREFIX_LIBDIR}/mports-setuptools-scm/8
MAKE_ENV+=	PYTHONPATH=${SCM8_BUILD_PATH}
TEST_ENV+=	BASH=${LOCALBASE}/bin/bash

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=4.6<6.3:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
