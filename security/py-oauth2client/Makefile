PORTNAME=	oauth2client
PORTVERSION=	4.1.3
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OAuth 2.0 client library
WWW=		https://googleapis.github.io/oauth2client/ \
		https://github.com/googleapis/oauth2client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}httplib2>=0.9.1:www/py-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0.1.7:devel/py-pyasn1@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1-modules>=0.0.5:devel/py-pyasn1-modules@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rsa>=3.1.4:security/py-rsa@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.6.1:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
