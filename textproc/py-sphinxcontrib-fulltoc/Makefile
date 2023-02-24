PORTNAME=	sphinxcontrib-fulltoc
PORTVERSION=	1.2.0
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx Fulltoc Extension
WWW=		https://pypi.org/project/sphinxcontrib-fulltoc/

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=1.8.1:devel/py-pbr@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
