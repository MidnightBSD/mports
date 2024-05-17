PORTNAME=	urllib3
PORTVERSION=	1.26.18
PORTEPOCH=	1
CATEGORIES=	net python
MASTER_SITES=	PYPI \
		https://github.com/urllib3/urllib3/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP library with thread-safe connection pooling, file post, and more
WWW=		https://github.com/urllib3/urllib3

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cpe python
USE_PYTHON=	autoplist concurrent cryptography_test distutils

CPE_VENDOR=	python

NO_ARCH=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	BROTLI SOCKS SSL
OPTIONS_DEFAULT=SOCKS

BROTLI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}brotli>=1.0.9:archivers/py-brotli@${PY_FLAVOR}
SOCKS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pysocks>=1.5.6<2.0:net/py-pysocks@${PY_FLAVOR}
SSL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}idna>=2.0.0:dns/py-idna@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}openssl>=0.14:security/py-openssl@${PY_FLAVOR}
SSL_USE=		PYTHON=cryptography

# 25 don't work
NO_TEST=	yes

.include <bsd.port.mk>
