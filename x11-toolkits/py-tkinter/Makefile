PORTNAME=	tkinter
DISTVERSION=	${PYTHON_DISTVERSION}
PORTREVISION=	8
CATEGORIES=	x11-toolkits python
MASTER_SITES=	PYTHON/ftp/python/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${DISTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the Tk widget set

LICENSE=	python
LICENSE_FILE=	${WRKDIR}/Python-${DISTVERSION}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c11 python tar:xz tk:86 xorg
USE_PYTHON=	allflavors autoplist pep517
USE_XORG=	x11

CFLAGS+=	-I${LOCALBASE}/include/tcl8.6/generic/

DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC_SUBDIR=	Modules

SUB_LIST+=	DISTVERSION=${DISTVERSION} \
		TK_VER=${TK_VER}
SUB_FILES=	pyproject.toml \
		setup.py
PLIST_FILES=	${PYTHONPREFIX_LIBDIR:S;${PREFIX}/;;}/lib-dynload/_tkinter${PYTHON_SOABI}.so

PORTSCOUT=	ignore:1

pre-configure:
	@${MV} ${WRKDIR}/pyproject.toml ${WRKSRC}
	@${MV} ${WRKDIR}/setup.py ${WRKSRC}

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_tkinter${PYTHON_SOABI}.so
	# lib-dynload is the expected location
	${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload
	(cd ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload && ${LN} -s ../site-packages/_tkinter${PYTHON_SOABI}.so)

do-test:
	@${PYTHON_CMD} -c 'import tkinter' # minimal smoke test

.include <bsd.port.mk>
