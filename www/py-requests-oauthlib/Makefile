# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	requests-oauthlib
PORTVERSION=	0.6.2
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OAuthlib authentication support for Requests

LICENSE=	iscl

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}oauthlib>=0.6.2:security/py-oauthlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.0.0:www/py-requests@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
