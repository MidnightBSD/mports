# $MidnightBSD$

PORTNAME=	gdbm
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	2
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the GNU dbm library

LICENSE=	python

LIB_DEPENDS=	libgdbm.so:${PORTSDIR}/databases/gdbm

USES=		python tar:xz
USE_PYTHON=	distutils autoplist

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHONPREFIX_LIBDIR}/lib-dynload

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${WRKDIR}/Python-${PORTVERSION}/Modules

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 3000
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
