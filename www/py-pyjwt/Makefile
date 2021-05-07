PORTNAME=	pyjwt
PORTVERSION=	1.7.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyJWT-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Web Token implementation in Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	distutils concurrent autoplist

OPTIONS_DEFINE=	RSASSA

RSASSA_DESC=		RSASSA-PKCS1 v1.5 signature support
RSASSA_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>0:security/py-cryptography@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
