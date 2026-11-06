PORTNAME=	smmap
PORTVERSION=	5.0.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sliding-window memory map manager
WWW=		https://smmap.readthedocs.io/en/latest/ \
		https://github.com/gitpython-developers/smmap

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517 unittest

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}smmap2

PORTSCOUT=	skipv:6.0.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
