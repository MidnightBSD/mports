PORTNAME=	pydispatcher
PORTVERSION=	2.0.7
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyDispatcher-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-producer-multi-consumer signal dispatching mechanism
WWW=		https://pydispatcher.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/license.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=40.8.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest
PEP517_WHEEL_DISTNAME=	PyDispatcher

.include <bsd.port.mk>
