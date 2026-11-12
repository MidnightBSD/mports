PORTNAME=	lazr.delegates
PORTVERSION=	4.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	lazr_delegates-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easily write objects that delegate behavior
WWW=		https://launchpad.net/lazr.delegates

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}zope.interface>=0:devel/py-zope.interface@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
