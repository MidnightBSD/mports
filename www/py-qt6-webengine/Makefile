PORTNAME=	webengine
DISTVERSION=	${PYQTWEBENGINE_VERSION}
PORTREVISION=	1
CATEGORIES=	www devel python
MASTER_SITES=	${MASTER_SITES_PYQTWEBENGINE}
PKGNAMEPREFIX=	${PYQT_PY_RELNAME}-
DISTNAME=	${PYQTWEBENGINE_DISTNAME}

PYQT_DIST=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the Qt6 toolkit, QtWebEngine module
WWW=		https://riverbankcomputing.com/software/pyqt

USES=		gl python pyqt:6 qt:6
USE_GL=		gl
USE_LOCALE=	C.UTF-8
USE_PYQT=	sip:build pyqt6
USE_PYTHON=	concurrent flavors
USE_QT=		base declarative positioning webchannel webengine

PLIST_SUB=	PYQT_WEBENGINE_VERSION=${DISTVERSION}

post-install:
	@${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/PyQt6 \
		-name '*.so*' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
