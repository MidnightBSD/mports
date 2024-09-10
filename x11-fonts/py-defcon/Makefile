PORTNAME=	defcon
PORTVERSION=	0.10.2
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of flexible objects for representing UFO data
WWW=		https://github.com/robotools/defcon

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/License.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=4.10.0:print/py-fonttools@${PY_FLAVOR}

USES=		python zip
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
