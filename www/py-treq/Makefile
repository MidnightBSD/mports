PORTNAME=	treq
PORTVERSION=	20.9.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Requests-like API built on top of twisted.web's Agent
WWW=		https://github.com/twisted/treq

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}incremental>=0:devel/py-incremental@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hyperlink>=19.0.0:www/py-hyperlink@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}twisted>=16.4.0:devel/py-twisted@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.13.0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.1.0:www/py-requests@${PY_FLAVOR}
# Depend directly on twisted[tls] dependencies
# As Twisted port may not (optionally) install them
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}openssl>=16.0.0:security/py-openssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}service_identity>=18.1.0:security/py-service_identity@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>=2.4:dns/py-idna@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist distutils
CPE_VENDOR=	twistedmatrix

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
