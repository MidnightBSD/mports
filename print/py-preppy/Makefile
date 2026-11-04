# Created by: Kozlov Sergey <kozlov.sergey.404@gmail.com>

PORTNAME=	preppy
PORTVERSION=	5.2.1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ReportLab's templating system

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

NO_ARCH=	yes

USES=		python
USE_PYTHON=	autoplist concurrent pep517

.include <bsd.port.mk>
