PORTNAME=	sqlite3
DISTVERSION=	${PYTHON_DISTVERSION}
PORTREVISION=	7
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${DISTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard Python binding to the SQLite3 library

LICENSE=	python
LICENSE_FILE=	${WRKDIR}/Python-${DISTVERSION}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

LIB_DEPENDS=	libsqlite3.so:databases/sqlite3
BUILD_DEPENDS+=	${LOCALBASE}/lib/libsqlite3.so:databases/sqlite3
RUN_DEPENDS+=	${LOCALBASE}/lib/libsqlite3.so:databases/sqlite3

USES=		compiler:c11 python tar:xz
USE_PYTHON=	allflavors autoplist pep517

DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC_SUBDIR=	Modules

SUB_LIST+=	DISTVERSION=${DISTVERSION}
SUB_FILES=	pyproject.toml
PLIST_FILES=	${PYTHONPREFIX_LIBDIR:S;${PREFIX}/;;}/lib-dynload/_sqlite3${PYTHON_EXT_SUFFIX}.so

PORTSCOUT=	ignore:1

pre-configure:
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
	@${MV} ${WRKDIR}/pyproject.toml ${WRKSRC}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_sqlite3${PYTHON_EXT_SUFFIX}.so
	# lib-dynload is the expected location
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload
	@(cd ${FAKE_DESTDIR}${PYTHONPREFIX_LIBDIR}/lib-dynload && ${LN} -s ../site-packages/_sqlite3${PYTHON_EXT_SUFFIX}.so)

.include <bsd.port.mk>
