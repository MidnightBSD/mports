PORTNAME=	raven
PORTVERSION=	6.10.0
PORTREVISION=	1
CATEGORIES=	devel python
#MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for Sentry

LICENSE=	bsd2

USES=		python
# either PYPI or github, whatever is newer
USE_GITHUB=	yes
GH_ACCOUNT=	getsentry
GH_PROJECT=	raven-python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
