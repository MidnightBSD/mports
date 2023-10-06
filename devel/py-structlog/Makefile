PORTNAME=	structlog
PORTVERSION=	18.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Structured Logging for Python
WWW=		https://www.structlog.org/

LICENSE=	apache2 mit
LICENSE_COMB=	dual
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.apache2
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colorama>=0.3.3:devel/py-colorama@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}six>=1.10.0:devel/py-six@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
