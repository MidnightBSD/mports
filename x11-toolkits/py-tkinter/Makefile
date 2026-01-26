PORTNAME=	tkinter
DISTVERSION=	${PYTHON_DISTVERSION}
PORTREVISION=	7
CATEGORIES=	x11-toolkits python
MASTER_SITES=	PYTHON/ftp/python/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the Tk widget set

LICENSE=	python

USES=		compiler:c11 python tar:xz tk:86 xorg
USE_PYTHON=	distutils autoplist allflavors
USE_XORG=	x11

CFLAGS+=	-I${LOCALBASE}/include/tcl8.6/generic/

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC_SUBDIR=	Modules

SUB_LIST+=	DISTVERSION=${DISTVERSION} \
		TK_VER=${TK_VER}
SUB_FILES=	pyproject.toml \
		setup.py
PLIST_FILES=	${PYTHONPREFIX_LIBDIR:S;${PREFIX}/;;}/lib-dynload/_tkinter${PYTHON_SOABI}.so

#PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHON_LIBDIR}/lib-dynload

PORTSCOUT=	ignore:1

.include <bsd.port.pre.mk>

pre-configure:
	@${MV} ${WRKDIR}/pyproject.toml ${WRKSRC}
	@${MV} ${WRKDIR}/setup.py ${WRKSRC}

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_tkinter${PYTHON_SOABI}.so
	# lib-dynload is the expected location
	${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload
	(cd ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload && ${LN} -s ../site-packages/_tkinter${PYTHON_SOABI}.so)

.include <bsd.port.post.mk>
