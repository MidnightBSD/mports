PORTNAME=	requests-futures
PORTVERSION=	1.0.1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP library written in Python for human beings
WWW=		https://github.com/ross/requests-futures

LICENSE=	Apache-2.0

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=1.2.0:www/py-requests@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
