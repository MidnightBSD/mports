PORTNAME=	python-socks
PORTVERSION=	2.1.1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core proxy (SOCKS4, SOCKS5, HTTP tunneling) functionality for Python
WWW=		https://pypi.org/project/python-socks/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}anyio>=3.3.4:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}async_timeout>=3.0.1:devel/py-async_timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}curio>=1.4:devel/py-curio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trio>=0.16.0:net/py-trio@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
