PORTNAME=	outcome
PORTVERSION=	1.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Capture the outcome of Python function calls
WWW=		https://pypi.org/project/outcome/

LICENSE=	mit apache2
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.MIT
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.APACHE2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>0:devel/py-attrs@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}async_generator>=0:devel/py-async_generator@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist distutils pytest
NO_ARCH=	yes

.include <bsd.port.mk>
