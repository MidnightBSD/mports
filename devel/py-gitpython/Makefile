PORTNAME=	gitpython
DISTVERSION=	3.1.30
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	GitPython-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Git Library
WWW=		https://github.com/gitpython-developers/GitPython

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS+=	git:devel/git
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ddt>=1.1.1:devel/py-ddt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gitdb2>=2.0.0:devel/py-gitdb2@${PY_FLAVOR} \
		git:devel/git

NO_ARCH=	yes
NO_TEST=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.mk>
