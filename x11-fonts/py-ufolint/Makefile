# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	ufolint
PORTVERSION=	1.0.0
CATEGORIES=	x11-fonts python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UFO source file linter

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}commandlines>=0:devel/py-commandlines@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=3.31.0:print/py-fonttools@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
