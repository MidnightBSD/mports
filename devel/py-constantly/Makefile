PORTNAME=	constantly
PORTVERSION=	23.10.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides symbolic constant support to Python projects
WWW=		https://github.com/twisted/constantly

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}versioneer>=0.29<0.30:devel/py-versioneer@${PY_FLAVOR}

.include <bsd.port.mk>
