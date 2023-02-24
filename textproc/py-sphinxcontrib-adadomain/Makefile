PORTNAME=	sphinxcontrib-adadomain
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx Adadomain Extension
WWW=		https://bitbucket.org/tkoskine/sphinxcontrib-adadomain

LICENSE=	bsd2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
