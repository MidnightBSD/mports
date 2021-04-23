PORTNAME=	gdbm
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	4
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the GNU dbm library

LICENSE=	python

LIB_DEPENDS=	libgdbm.so:databases/gdbm

PORTSCOUT=	ignore:1

USES=		compiler:c11 python:3.6+ tar:xz
USE_PYTHON=	distutils autoplist allflavors

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHONPREFIX_LIBDIR}/lib-dynload

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${WRKDIR}/Python-${PORTVERSION}/Modules

.include <bsd.port.pre.mk>

post-extract:
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py

.include <bsd.port.post.mk>
