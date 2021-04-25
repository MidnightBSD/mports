# Created by: Yuri Victorovich <yuri@rawbw.com>

PORTNAME=	pathlib2
PORTVERSION=	2.3.5
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-oriented filesystem paths

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
