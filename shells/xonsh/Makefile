PORTNAME=	xonsh
PORTVERSION=	0.11.0
CATEGORIES=	shells python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python-ish BASH-wards shell
WWW=		https://xon.sh

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/license

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}amalgamate>=0:devel/py-amalgamate@${PY_FLAVOR}

NO_ARCH=	yes

USES=		python
USE_PYTHON=	distutils autoplist concurrent

.include <bsd.port.mk>
