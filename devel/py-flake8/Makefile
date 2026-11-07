PORTNAME=	flake8
PORTVERSION=	7.3.0
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code checking using pep8 and pyflakes
WWW=		https://flake8.pycqa.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mccabe>=0.7.0<0.8.0:devel/py-mccabe@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycodestyle>=2.14.0<2.15.0:devel/py-pycodestyle@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyflakes>=4.0.0<4.1.0:devel/py-pyflakes@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent distutils pytest
NO_ARCH=	yes

USE_GITHUB=	yes

GH_ACCOUNT=	PyCQA

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR}

.include <bsd.port.mk>
