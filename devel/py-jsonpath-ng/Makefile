PORTNAME=	jsonpath-ng
DISTVERSION=	1.8.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSONPath implementation based on jsonpath-rw and jsonpath-rw-ext
WWW=		https://github.com/h2non/jsonpath-ng

LICENSE=	Apache-2.0

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
