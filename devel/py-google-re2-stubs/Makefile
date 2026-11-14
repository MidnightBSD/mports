PORTNAME=	google-re2-stubs
DISTVERSION=	0.1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python stubs for google-re2 package
WWW=		https://pypi.org/project/google-re2-stubs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-re2>=1.0:devel/py-google-re2@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
