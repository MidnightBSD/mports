PORTNAME=	sqlite3
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	5
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${PORTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard Python binding to the SQLite3 library

LICENSE=	python
LICENSE_FILE=	${WRKDIR}/Python-${PORTVERSION}/LICENSE

LIB_DEPENDS=	libsqlite3.so:databases/sqlite3
BUILD_DEPENDS+=	${LOCALBASE}/lib/libsqlite3.so:databases/sqlite3
RUN_DEPENDS+=	${LOCALBASE}/lib/libsqlite3.so:databases/sqlite3

USES=		compiler:c11 python:2.7+ tar:xz
USE_PYTHON=	autoplist distutils allflavors

DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${WRKDIR}/Python-${PORTVERSION}/Modules

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHON_LIBDIR}/lib-dynload

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 200000
USE_GCC=	yes
.endif

post-extract:
.if ${PYTHON_REL} < 30000
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_LIBDIR}/lib-dynload/_sqlite3*.so

.include <bsd.port.post.mk>
