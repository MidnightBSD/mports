PORTNAME=	kcalendarcore
DISTVERSION=	${KDE_FRAMEWORKS_VERSION}
PORTREVISION=	1
CATEGORIES=	net kde kde-frameworks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides access to and handling of calendar data

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>0:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}shiboken6-tools>0:devel/shiboken6-tools@${PY_FLAVOR}
LIB_DEPENDS=	libical.so:devel/libical \
		libpyside6.abi${PYTHON_MAJOR_VER}.so:devel/pyside6@${PY_FLAVOR} \
		libshiboken6.abi${PYTHON_MAJOR_VER}.so:devel/shiboken6@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyside6>0:devel/pyside6@${PY_FLAVOR}

USES=		cmake gl kde:6 python qt:6 tar:xz
USE_GL=		gl opengl
USE_KDE=	ecm:build
USE_QT=		base declarative tools:build

CMAKE_ARGS=	-DPython_EXECUTABLE:FILEPATH=${PYTHON_CMD}

.include <bsd.port.mk>
