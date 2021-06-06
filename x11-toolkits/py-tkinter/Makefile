PORTNAME=	tkinter
DISTVERSION=	${PYTHON_DISTVERSION}
PORTREVISION=	6
CATEGORIES=	x11-toolkits python
MASTER_SITES=	PYTHON/ftp/python/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the Tk widget set

LICENSE=	python

USE_PYTHON=	distutils autoplist allflavors
USES=		compiler:c11 python:2.7+ tar:xz tk

CFLAGS+=	-I${LOCALBASE}/include/tcl8.6/generic/

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC_SUBDIR=	Modules

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHON_LIBDIR}/lib-dynload

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 30000
	@${SED} -e "s|%%TK_VER%%|${TK_VER}|" ${FILESDIR}/setup.py > ${WRKSRC}/setup.py
.else
	@${SED} -e "s|%%TK_VER%%|${TK_VER}|" ${FILESDIR}/setup3.py > ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
