# $MidnightBSD$

PORTNAME=	service_identity
PORTVERSION=	17.0.0
CATEGORIES=	security python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Service identity verification for pyOpenSSL

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=15.2:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openssl>=0.15:security/py-openssl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0.1.9:devel/py-pyasn1@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1-modules>=0.0.8:devel/py-pyasn1-modules@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}characteristic>=14.1:devel/py-characteristic@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
