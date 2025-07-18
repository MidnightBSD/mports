PORTNAME=	qscintilla2
DISTVERSION=	${QSCI2_VERSION}
PORTREVISION=	3
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITES_QSCI2}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}qt5-
DISTNAME=	${QSCI2_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for QScintilla2 (PyQt5), QSci module
WWW=		https://riverbankcomputing.com/software/pyqt

LIB_DEPENDS=	libqscintilla2_qt5.so:devel/qscintilla2@qt5

DISTINFO_FILE=	${.CURDIR:H}/qscintilla2/distinfo
DESTDIRNAME=	INSTALL_ROOT

USES=		python pyqt:5 gl qt:5
USE_GL=		gl
USE_PYQT=	pyqt5 qtbuilder:build sip:build
USE_PYTHON=	concurrent flavors
USE_QT=		core gui printsupport widgets buildtools:build qmake:build

OPTIONS_DEFINE=		DEBUG
DEBUG_CONFIGURE_ON=	--debug --trace

WRKSRC=		${WRKDIR}/${DISTNAME}/Python
ALL_TARGET=	#empty

post-extract:
	${CP} ${WRKSRC}/pyproject-qt5.toml ${WRKSRC}/pyproject.toml

do-build:
	(cd ${WRKSRC} ; sip-build-${PYTHON_VER} --qmake ${QMAKE} --verbose --no-make --build-dir build ; ${MAKE} -C ./build )

do-install:
	(cd ${WRKSRC} ; ${MAKE} -C ./build install INSTALL_ROOT=${FAKE_DESTDIR} )

post-install:
	${STRIP_CMD} ${STAGEDIR}${PYTHONPREFIX_SITELIBDIR}/PyQt5/Qsci.abi3.so

.include <bsd.port.mk>
