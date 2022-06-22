PORTNAME=	node-semver # PyPI name
DISTVERSION=	0.8.1
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python version of node-semver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	distutils autoplist

USE_GITHUB=	yes
GH_ACCOUNT=	podhmo
GH_PROJECT=	python-node-semver # PyPI project node-semver points to this project

NO_ARCH=	yes

.include <bsd.port.mk>
