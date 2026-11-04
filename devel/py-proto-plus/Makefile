PORTNAME=	proto-plus
PORTVERSION=	1.28.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	proto_plus-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beautiful, Pythonic protocol buffers
WWW=		https://googleapis.dev/python/proto-plus/latest/ \
		https://github.com/googleapis/google-cloud-python/tree/main/packages/proto-plus \
		https://github.com/googleapis/google-cloud-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}protobuf>=4.25.8,1<8.0.0,1:devel/py-protobuf@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
