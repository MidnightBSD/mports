PORTNAME=	threadpoolctl
PORTVERSION=	3.6.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Thread-pool controls
WWW=		https://github.com/joblib/threadpoolctl

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=2<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
