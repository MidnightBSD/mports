PORTNAME=	docker
PORTVERSION=	7.2.0
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for the Docker Engine API
WWW=		https://github.com/docker/docker-py

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}paramiko>=2.4.3:security/py-paramiko@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.26.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}urllib3>=1.26.0,1:net/py-urllib3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}websocket-client>=1.3.0:www/py-websocket-client@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
