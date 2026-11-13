PORTNAME=	prompt-toolkit
PORTVERSION=	3.0.53
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	prompt_toolkit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for building powerful interactive command lines in Python
WWW=		https://python-prompt-toolkit.readthedocs.io/en/master/ \
		https://github.com/prompt-toolkit/python-prompt-toolkit

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wcwidth>=0.1.4:devel/py-wcwidth@${PY_FLAVOR}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
