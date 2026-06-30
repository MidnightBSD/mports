PORTNAME=	GitPython
PORTVERSION=	3.1.50
PORTREVISION=	0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	gitpython-${PORTVERSION}
MASTER_SITE_SUBDIR=	g/gitpython

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Git Library
WWW=		https://github.com/gitpython-developers/GitPython

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS+=	git:devel/git
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ddt>=1.1.1:devel/py-ddt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gitdb>=4.0.0:devel/py-gitdb@${PY_FLAVOR} \
		git:devel/git

NO_ARCH=	yes
NO_TEST=	yes
USES=		python
USE_PYTHON=	allflavors autoplist concurrent distutils

.include <bsd.port.mk>
