PORTNAME=	StrEnum
DISTVERSION=	0.5.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enum that inherits from str
WWW=		https://pypi.org/project/StrEnum/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

PEP517_WHEEL_DISTNAME=	${PORTNAME:tl:C|[-_.]+|_|g}

NO_ARCH=	yes
USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517
# pytest
NO_TEST=	yes

DISTNAME=	${PORTNAME:tl}-${DISTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
