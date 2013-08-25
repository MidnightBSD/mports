# $MidnightBSD: mports/databases/py-sqlite3/Makefile,v 1.3 2013/02/18 13:18:57 laffer1 Exp $

PORTNAME=	sqlite3
PORTVERSION=	${PYTHON_PORTVERSION}
PORTREVISION=	2
CATEGORIES=	databases python
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PYTHON_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard Python binding to the SQLite3 library

LICENSE=	python

LIB_DEPENDS=	sqlite3:${PORTSDIR}/databases/sqlite3

PLIST_FILES=	%%PYTHON_SITELIBDIR%%/_sqlite3.so
DIST_SUBDIR=	python
USE_PYTHON=	yes
USE_PYDISTUTILS=yes
USE_XZ=		yes
WRKSRC=		${PYTHON_WRKSRC}/Modules
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo

PYDISTUTILS_NOEGGINFO=	yes

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 300
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
