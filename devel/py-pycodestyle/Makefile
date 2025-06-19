PORTNAME=	pycodestyle
PORTVERSION=	2.13.0
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python style guide checker
WWW=		https://pycodestyle.readthedocs.io/en/latest/ \
		https://pypi.org/project/pycodestyle/ \
		https://github.com/PyCQA/pycodestyle

LICENSE=	mit

USES=		python
USE_GITHUB=	yes
GH_ACCOUNT=	PyCQA
USE_PYTHON=	autoplist concurrent distutils
# pytest
NO_ARCH=	yes

# tests pass local, fail on magus
NO_TEST=	yes

.include <bsd.port.mk>
