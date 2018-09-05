# $MidnightBSD$

PORTNAME=	buildbot-worker
PORTVERSION=	0.9.15
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Buildbot Worker Daemon

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}future>=0.15.2:devel/py-future \
		${PYTHON_PKGNAMEPREFIX}twisted>=14.0.1:devel/py-twisted
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>0:devel/py-twisted \
		${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock

USES=		python
USE_PYTHON=	autoplist distutils
USE_RC_SUBR=	buildbot-worker

SUB_LIST+=	PYTHON_CMD=${PYTHON_CMD}

NO_ARCH=	yes

PLIST_FILES=	man/man1/buildbot-worker.1.gz

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/buildbot-worker.1 ${STAGEDIR}${MANPREFIX}/man/man1

do-test:
	${MKDIR} ${WRKDIR}/tmp
	cd ${WRKDIR}/tmp && ${PYTHON_CMD} -m twisted.trial buildbot_worker.test

.include <bsd.port.mk>
