PORTNAME=	zope.i18nmessageid
DISTVERSION=	6.0.1
CATEGORIES=	textproc www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	zope

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Message Identifiers for internationalization
WWW=		https://pypi.org/project/zope.i18nmessageid/

LICENSE=	zpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist pep517
PEP517_WHEEL_DISTNAME=	zope_i18nmessageid

.include <bsd.port.mk>
