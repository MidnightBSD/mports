# $MidnightBSD$

PORTNAME=	sqlite3
PORTVERSION=	${PYTHON_PORTVERSION}
CATEGORIES=	databases python
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PYTHON_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard Python binding to the SQLite3 library
LICENSE=	python

LIB_DEPENDS=	sqlite3.8:${PORTSDIR}/databases/sqlite3

PLIST_FILES=	lib/%%PYTHON_VERSION%%/site-packages/_sqlite3.so
DIST_SUBDIR=	python
USE_PYTHON=	2.5+
USE_PYDISTUTILS=yes
WRKSRC=		${PYTHON_WRKSRC}/Modules
MD5_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo

PYDISTUTILS_NOEGGINFO=	yes

.include <bsd.port.pre.mk>

pre-extract:
	@${CAT} ${PKGMESSAGE}

post-extract:
.if ${PYTHON_REL} < 300
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
