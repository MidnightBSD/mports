PORTNAME=	daemon
PORTVERSION=	2.3.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-daemon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Well-behaved daemon framework for Python
WWW=		https://pypi.org/project/python-daemon/

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0:textproc/py-docutils@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lockfile>=0.10:devel/py-lockfile@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
