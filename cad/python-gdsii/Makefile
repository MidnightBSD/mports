PORTNAME=	python-gdsii
PORTVERSION=	0.2.1
PORTREVISION=	3
CATEGORIES=	cad python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GDSII manipulation library
WWW=		https://pythonhosted.org/python-gdsii/

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/LGPL-3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes

.include <bsd.port.mk>
