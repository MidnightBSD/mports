# $MidnightBSD$

PORTNAME=	urllib3
PORTVERSION=	1.22
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP library with thread-safe connection pooling, file post, and more

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=1.3.4:security/py-cryptography \
		${PYTHON_PKGNAMEPREFIX}idna>=2.0:dns/py-idna \
		${PY_IPADDRESS} \
		${PYTHON_PKGNAMEPREFIX}openssl>=16.0:security/py-openssl \
		${PYTHON_PKGNAMEPREFIX}pysocks>=1.5.7:net/py-pysocks
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock \
		${PYTHON_PKGNAMEPREFIX}nose>=0:devel/py-nose \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest
#TEST_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tornado>=0:www/py-tornado

USES=		python
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes
SUB_FILES=	pkg-message

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi
.endif

.include <bsd.port.post.mk>
