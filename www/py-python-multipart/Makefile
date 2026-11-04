PORTNAME=	python-multipart
PORTVERSION=	0.0.28
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python_multipart-${PORTVERSION}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Streaming multipart parser for Python
WWW=		https://multipart.fastapiexpert.com/ \
		https://github.com/Kludex/python-multipart

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
