PORTNAME=	isodate
PORTVERSION=	0.7.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ISO 8601 date/time/duration parser and formater

LICENSE=	bsd3

NO_ARCH=	yes
USE_PYTHON=	autoplist concurrent pep517
USES=		python

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

LICENSE_FILE=	${WRKSRC}/LICENSE

.include <bsd.port.mk>
