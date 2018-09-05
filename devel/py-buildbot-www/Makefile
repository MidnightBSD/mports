# $MidnightBSD$

PORTNAME=	buildbot-www
PORTVERSION=	0.9.15
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Continuous Integration Framework (WWW)

LICENSE=	gpl2

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}buildbot>=${PORTVERSION}:devel/py-buildbot \
		${PYTHON_PKGNAMEPREFIX}buildbot-pkg>=${PORTVERSION}:devel/py-buildbot-pkg \
		${PYTHON_PKGNAMEPREFIX}mock>0.8.0:devel/py-mock
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}buildbot-console-view>=${PORTVERSION}:devel/py-buildbot-console-view \
		${PYTHON_PKGNAMEPREFIX}buildbot-grid-view>=${PORTVERSION}:devel/py-buildbot-grid-view \
		${PYTHON_PKGNAMEPREFIX}buildbot-waterfall-view>=${PORTVERSION}:devel/py-buildbot-waterfall-view \
		${PYTHON_PKGNAMEPREFIX}service_identity>=16.0.0:security/py-service_identity

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
