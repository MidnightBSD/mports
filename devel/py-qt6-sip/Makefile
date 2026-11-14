PORTNAME=	PyQt6-sip
DISTVERSION=	${PYQTSIP_VERSION}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_PYQT6SIP}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PYQTSIP_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python to C and C++ bindings generator
WWW=		https://pypi.org/project/PyQt6-sip/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78 pyqt:6
USE_PYTHON=	autoplist concurrent pep517
PEP517_WHEEL_DISTNAME=	pyqt6_sip
USE_PYQT=	#

.include <bsd.port.mk>
