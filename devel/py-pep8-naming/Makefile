PORTNAME=	pep8-naming
DISTVERSION=	0.15.1
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check PEP-8 naming conventions, plugin for flake8
WWW=		https://pypi.org/project/pep8-naming/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flake8>=5.0.0:devel/py-flake8@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}entrypoints>=0:devel/py-entrypoints@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
