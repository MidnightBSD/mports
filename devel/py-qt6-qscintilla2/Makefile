PORTNAME=	qscintilla2
DISTVERSION=	${QSCI2_VERSION}
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_QSCI2}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}qt6-
DISTNAME=	${QSCI2_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for QScintilla2 (PyQt6), QSci module
WWW=		https://riverbankcomputing.com/software/pyqt \
		https://www.riverbankcomputing.com/software/qscintilla

LICENSE=	gpl3

LIB_DEPENDS=	libqscintilla2_qt6.so:devel/qscintilla2@qt6

USES=		python pyqt:6 gl qt:6
USE_GL=		gl
USE_LOCALE=	C.UTF-8
USE_PYQT=	pyqt6 qtbuilder:build sip:build
USE_PYTHON=	concurrent flavors
USE_QT=		base

SIP_ARGS=	--qmake ${QMAKE} --verbose --build-dir build

ALL_TARGET=	#empty
DESTDIRNAME=	INSTALL_ROOT
DISTINFO_FILE=	${.CURDIR:H}/qscintilla2/distinfo
WRKSRC=		${WRKDIR}/${DISTNAME}/Python

OPTIONS_DEFINE=	DEBUG
DEBUG_VARS=	SIP_ARGS+=--debug --tracing

post-extract:
	${CP} ${WRKSRC}/pyproject-qt6.toml ${WRKSRC}/pyproject.toml

do-build:
	(cd ${WRKSRC} ; ${SETENV} ${MAKE_ENV} ${SIP} ${SIP_ARGS} ; ${SETENV} ${MAKE_ENV} ${MAKE} -C ./build )

do-install:
	(cd ${WRKSRC} ; ${SETENV} ${MAKE_ENV} ${MAKE} -C ./build install INSTALL_ROOT=${FAKE_DESTDIR} )

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/PyQt6/Qsci.abi3.so

.include <bsd.port.mk>
