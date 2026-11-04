PORTNAME=	webengine
DISTVERSION=	${PYQTWEBENGINE_VERSION}
PORTREVISION=	2
CATEGORIES=	www devel python
MASTER_SITES=	${MASTER_SITES_PYQTWEBENGINE}
PKGNAMEPREFIX=	${PYQT_PY_RELNAME}-
DISTNAME=	${PYQTWEBENGINE_DISTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the Qt6 toolkit, QtWebEngine module
WWW=		https://riverbankcomputing.com/software/pyqt

LICENSE=	gpl3

USES=		gl pyqt:6,dist python qt:6
USE_GL=		gl
USE_LOCALE=	C.UTF-8
USE_PYQT=	pyqt6 qtbuilder:build sip:build
USE_PYTHON=	concurrent flavors
USE_QT=		base declarative positioning webchannel webengine

PLIST_SUB=	PYQT_WEBENGINE_VERSION=${DISTVERSION}

post-install:
	@${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/PyQt6 \
		-name '*.so*' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
