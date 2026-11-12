PORTNAME=	GitPython
PORTVERSION=	3.1.62
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Git Library
WWW=		https://github.com/gitpython-developers/GitPython

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	git:devel/git \
		${PYTHON_PKGNAMEPREFIX}gitdb>=4.0.1<5:devel/py-gitdb@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes
USES=		cpe python
CPE_VENDOR=	gitpython_project
USE_PYTHON=	allflavors autoplist concurrent pep517

DISTNAME=	gitpython-${PORTVERSION}

.include <bsd.port.mk>
