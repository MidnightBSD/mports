PORTNAME=	GitPython
PORTVERSION=	3.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Git Library
WWW=		https://github.com/gitpython-developers/GitPython

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	git:devel/git \
		${PYTHON_PKGNAMEPREFIX}gitdb>=4.0.1<5:devel/py-gitdb@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes
USES=		cpe python:3.9+ python-setuptools:78
CPE_VENDOR=	gitpython_project
USE_PYTHON=	allflavors autoplist concurrent pep517

DISTNAME=	gitpython-${PORTVERSION}
PEP517_WHEEL_DISTNAME=	gitpython

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=3.10.0.2:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
