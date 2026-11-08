PORTNAME=	buildbot-pkg
DISTVERSION=	4.3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Buildbot packaging tools
WWW=		https://buildbot.net

LICENSE=	gpl2
#LICENSE_FILE=	Not packaged in sdist

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

DISTNAME=	buildbot_pkg-${DISTVERSION}

BUILD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=21.2.1:devel/py-setuptools@${PY_FLAVOR}
MAKE_ENV+=	BUILDBOT_VERSION=${DISTVERSION}

.include <bsd.port.mk>
