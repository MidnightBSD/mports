PORTNAME=	trio
DISTVERSION=	0.34.0
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for async concurrency and I/O
WWW=		https://pypi.org/project/trio/ \
		https://github.com/python-trio/trio

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE.APACHE2
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.MIT

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PY_EXCEPTIONGROUP} \
		${PYTHON_PKGNAMEPREFIX}attrs>=23.2.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>0:dns/py-idna@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}outcome>0:devel/py-outcome@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sniffio>=1.3.0:devel/py-sniffio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sortedcontainers>0:devel/py-sortedcontainers@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist pep517 allflavors

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
