# $MidnightBSD$

PORTNAME=	bsddb
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	4
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard Python bindings to the Berkeley DB library

LICENSE=	python

USE_BDB=	48+
USE_PYTHON=	distutils autoplist
USES=		bdb python:2.7 tar:xz

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${WRKDIR}/Python-${PORTVERSION}/Modules

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHON_LIBDIR}/lib-dynload

MAKE_ENV=	BSDDB_VERSION=${BDB_LIB_NAME}

.include <bsd.port.pre.mk>

post-extract:
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}

post-patch:
	${REINPLACE_CMD} -e \
		's,^\(#include.*\)\(db\.h.*\)$$,\1${BDB_INCLUDE_DIR}/\2,' \
		${WRKSRC}/bsddb.h

.include <bsd.port.post.mk>
