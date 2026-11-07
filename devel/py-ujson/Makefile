PORTNAME=	ujson
PORTVERSION=	6.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ultra fast JSON encoder and decoder for Python
WWW=		https://github.com/esnme/ultrajson

LICENSE=	bsd3 TclTk
LICENSE_COMB=	multi
LICENSE_NAME_TclTk=	Tcl/Tk License
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_TclTk=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_TclTk=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=9.2:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		cpe python:3.10+ python-setuptools:83
CPE_PRODUCT=	ultrajson
CPE_VENDOR=	ultrajson_project
USE_PYTHON=	autoplist pep517

.include <bsd.port.mk>
