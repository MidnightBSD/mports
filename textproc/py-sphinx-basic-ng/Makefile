PORTNAME=	sphinx-basic-ng
PORTVERSION=	1.0.0b2
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinx_basic_ng-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern skeleton for Sphinx themes
WWW=		https://sphinx-basic-ng.readthedocs.io/en/latest/ \
		https://github.com/pradyunsg/sphinx-basic-ng

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=4.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
