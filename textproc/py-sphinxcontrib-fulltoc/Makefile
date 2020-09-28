PORTNAME=	sphinxcontrib-fulltoc
PORTVERSION=	1.2.0
CATEGORIES=	textproc
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx Fulltoc Extension

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pbr>=1.8.1:devel/py-pbr@${PY_FLAVOR}
RUN_DEPENDS=	${PY_SPHINX}

USES=		python
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
