PORTNAME=	PyQt5-sip
DISTVERSION=	${PYQTSIP_VERSION}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_PYQT5SIP}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PYQTSIP_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python to C and C++ bindings generator
WWW=		https://pypi.org/project/PyQt5-sip/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ pyqt:5 python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517
USE_PYQT=	#

PEP517_WHEEL_DISTNAME=	${PORTNAME:tl:C|[-_.]+|_|g}

.include <bsd.port.mk>
