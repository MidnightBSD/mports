PORTNAME=	trustme
PORTVERSION=	1.2.1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Top quality TLS certs while you wait, for the discerning tester
WWW=		https://github.com/python-trio/trustme

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE.APACHE2
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.MIT

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}idna>=2.0:dns/py-idna@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}openssl>=0:security/py-openssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}service-identity>=0:security/py-service-identity@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist cryptography pep517 pytest
NO_ARCH=	yes

.include <bsd.port.mk>
