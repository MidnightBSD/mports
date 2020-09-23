# Created by: Bartek Rutkowski <ports@robakdesign.com>

PORTNAME=	click
PORTVERSION=	7.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Click-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package for creating command line interfaces

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m pytest -v -p no:warnings

.include <bsd.port.mk>
