PORTNAME=	marshmallow
PORTVERSION=	3.20.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simplified object serialization for Python
WWW=		https://marshmallow.readthedocs.io/en/stable/ \
		https://github.com/marshmallow-code/marshmallow

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=17.0:devel/py-packaging@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

CPE_VENDOR=	marshmallow_project

.include <bsd.port.mk>
