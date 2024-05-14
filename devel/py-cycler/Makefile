PORTNAME=	cycler
PORTVERSION=	0.12.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI/source/C/Cycler
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Composable style cycles
WWW=		https://matplotlib.org/cycler/

LICENSE=	bsd2

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
