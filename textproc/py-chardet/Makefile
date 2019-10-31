# $MidnightBSD$

PORTNAME=	chardet
PORTVERSION=	3.0.4
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
MASTER_SITES=	CHEESESHOP

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal encoding detector for Python 2 and 3

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-runner>0:devel/py-pytest-runner@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.mk>
