PORTNAME=	urllib3
PORTVERSION=	1.25.7
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP library with thread-safe connection pooling, file post, and more

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	BROTLI SOCKS SSL
OPTIONS_DEFAULT=SOCKS SSL

BROTLI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}brotlipy>=0.6.0:archivers/py-brotlipy@${PY_FLAVOR}
SOCKS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pysocks>=1.5.6:net/py-pysocks@${PY_FLAVOR}
SSL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=2.0:dns/py-idna@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}cryptography>=1.3.4:security/py-cryptography@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}openssl>=0.14:security/py-openssl@${PY_FLAVOR} \
			${PY_IPADDRESS}

.include <bsd.port.mk>
