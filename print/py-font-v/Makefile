PORTNAME=	font-v
PORTVERSION=	2.1.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font version reporting and modification tool
WWW=		https://github.com/source-foundry/font-v

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/docs/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=0:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}GitPython>=0:devel/py-gitpython@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
