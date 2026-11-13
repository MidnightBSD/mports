PORTNAME=	buildbot-worker
DISTVERSION=	4.3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	buildbot_worker-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Buildbot Worker Daemon
WWW=		https://buildbot.net

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}autobahn>=0.16.0:www/py-autobahn@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}msgpack>=0.6.0:devel/py-msgpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}twisted>=21.2.0:devel/py-twisted@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517
USE_RC_SUBR=	buildbot-worker

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes
SUB_LIST+=	PYTHON_CMD=${PYTHON_CMD} \
		PYTHON_VER=${PYTHON_VER}

BUILDBOT_REMOVE_ME=	${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}/buildbot_worker

USERS=		buildbot
GROUPS=		buildbot

POST_PLIST+=	fix-plist
PLIST_FILES=	share/man/man1/buildbot-worker.1.gz

# XXX fixup plist. see:
# https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=205056
fix-plist:
	${REINPLACE_CMD} -e 's|^${BUILDBOT_REMOVE_ME}$$||' ${TMPPLIST}

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/buildbot-worker.1 ${PREFIX}/share/man/man1

do-test:
	${MKDIR} ${WRKDIR}/tmp
	cd ${WRKDIR}/tmp && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} ${FILESDIR}/run-tests.py ${WRKSRC} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

.include <bsd.port.mk>
