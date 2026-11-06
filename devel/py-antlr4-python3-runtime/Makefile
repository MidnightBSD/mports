PORTNAME=	antlr4-python3-runtime
PORTVERSION=	4.13.2
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSd.org
COMMENT=	ANother Tool for Language Recognition (python3 runtime)
WWW=		https://www.antlr.org/

LICENSE=	bsd3

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

DISTNAME=	antlr4_python3_runtime-${PORTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.2:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
