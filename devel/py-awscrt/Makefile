PORTNAME=	awscrt
PORTVERSION=	0.20.12
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common runtime for AWS Python projects
WWW=		https://github.com/awslabs/aws-crt-python

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	cmake:devel/cmake-core \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python ssl
USE_PYTHON=	autoplist concurrent pep517

MAKE_ENV=	AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
