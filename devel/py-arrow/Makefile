PORTNAME=	arrow
PORTVERSION=	1.2.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better dates and times for Python
WWW=		https://github.com/arrow-py/arrow

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dateutil>=2.7.0:devel/py-dateutil@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
