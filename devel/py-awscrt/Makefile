PORTNAME=	awscrt
PORTVERSION=	0.19.12
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common runtime for AWS Python projects
WWW=		https://github.com/awslabs/aws-crt-python

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	cmake:devel/cmake-core

USES=		python ssl
USE_PYTHON=	autoplist concurrent distutils

MAKE_ENV=	AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>