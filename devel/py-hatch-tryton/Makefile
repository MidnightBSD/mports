PORTNAME=	hatch-tryton
PORTVERSION=	0.1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	hatch_tryton-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hatchling plugin for Tryton
WWW=		https://www.tryton.org/ \
		https://foss.heptapod.net/tryton/hatch-tryton

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1:devel/py-hatchling@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517 unittest

NO_ARCH=	yes

.include <bsd.port.mk>
