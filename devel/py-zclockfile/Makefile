PORTNAME=	zclockfile
DISTVERSION=	4.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	zc_lockfile-${DISTVERSION}
DIST_SUBDIR=	zope

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic inter-process locks
WWW=		https://pypi.org/project/zc.lockfile/

LICENSE=	zpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

PEP517_WHEEL_DISTNAME=	zc_lockfile

.include <bsd.port.mk>
