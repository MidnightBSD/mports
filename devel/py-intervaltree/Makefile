# Created by: antoine@FreeBSD.org

PORTNAME=	intervaltree
PORTVERSION=	3.0.2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Editable interval tree data structure for Python 2 and 3

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sortedcontainers>=0:devel/py-sortedcontainers@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
