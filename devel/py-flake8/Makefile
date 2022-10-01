PORTNAME=	flake8
PORTVERSION=	5.0.4
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code checking using pep8 and pyflakes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mccabe>=0:devel/py-mccabe@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycodestyle>=0:devel/py-pycodestyle@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyflakes>=0:devel/py-pyflakes@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
