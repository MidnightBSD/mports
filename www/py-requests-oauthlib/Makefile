PORTNAME=	requests-oauthlib
PORTVERSION=	1.4.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OAuthlib authentication support for Requests
WWW=		https://github.com/requests/requests-oauthlib

LICENSE=	iscl

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}oauthlib>=3.0.0:security/py-oauthlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.0.0:www/py-requests@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
