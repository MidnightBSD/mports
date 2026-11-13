PORTNAME=	txaio
DISTVERSION=	26.6.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compatibility API between asyncio/Twisted/Trollius
WWW=		https://github.com/crossbario/txaio

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}twisted>=22.10.0:devel/py-twisted@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zope.interface>=5.2.0:devel/py-zope.interface@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest

TEST_ARGS=	--strict-markers --strict-config

NO_ARCH=	yes

OPTIONS_DEFINE=		TWISTED
OPTIONS_DEFAULT=	TWISTED

TWISTED_DESC=	Twisted network backend support

TWISTED_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=22.10.0:devel/py-twisted@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}zope.interface>=5.2.0:devel/py-zope.interface@${PY_FLAVOR}

.include <bsd.port.mk>
