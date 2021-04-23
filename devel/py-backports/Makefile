PORTNAME=	backports
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PORTVERSION=	1
CATEGORIES=	devel python
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared namespace shim for py-backports.* ports

LICENSE=	mit

NO_FETCH=	yes
NO_BUILD=	yes
NO_ARCH=	yes
USES=		python:3.6+
USE_PYTHON=	flavors py3kplist

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${PYTHON_SITELIBDIR}/backports/__init__.py \
		${PYTHON_SITELIBDIR}/backports/__init__.pyc \
		${PYTHON_SITELIBDIR}/backports/__init__.pyo

do-install:
	${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/backports
	${ECHO_CMD} "__path__ = __import__('pkgutil').extend_path(__path__, __name__)" > ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/backports/__init__.py
	${PYTHON_CMD} -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	${PYTHON_CMD} -O -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
