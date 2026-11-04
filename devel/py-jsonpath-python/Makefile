PORTNAME=	jsonpath-python
PORTVERSION=	1.1.5
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	jsonpath_python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight JSONPath implementation for Python
WWW=		https://github.com/sean2077/jsonpath-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
