PORTNAME=	time-machine
DISTVERSION=	2.11.0
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/1}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Travel through time in your Python tests
WWW=		https://github.com/adamchainz/time-machine

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.40.0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-dateutil>=2.8.2:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.5:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

post-install:
		${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/_time_machine${PYTHON_TAG}.so

.include <bsd.port.mk>
