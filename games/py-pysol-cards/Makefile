# Created by: Danilo Egea Gondolfo <danilo@FreeBSD.org>

PORTNAME=	pysol-cards
PORTVERSION=	0.10.1
CATEGORIES=	games python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pysol_cards-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Deal PySol FC Cards

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>0:devel/py-pbr@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}random2>=0:math/py-random2@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
