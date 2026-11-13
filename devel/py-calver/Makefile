PORTNAME=	calver
PORTVERSION=	2025.10.20
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Setuptools extension for CalVer package versions
WWW=		https://github.com/di/calver

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	allflavors 	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
