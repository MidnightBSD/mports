# $MidnightBSD: mports/databases/py-gdbm/Makefile,v 1.2 2009/10/14 00:19:56 laffer1 Exp $
# $FreeBSD: ports/databases/py-gdbm/Makefile,v 1.13 2007/07/30 09:41:05 alexbl Exp $

PORTNAME=	gdbm
PORTVERSION=	${PYTHON_PORTVERSION}
CATEGORIES=	databases python
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PYTHON_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the GNU dbm library
LICENSE=	python

LIB_DEPENDS=	gdbm.3:${PORTSDIR}/databases/gdbm

PLIST_FILES=	lib/%%PYTHON_VERSION%%/site-packages/gdbm.so
DIST_SUBDIR=	python
USE_PYTHON=	yes
USE_PYDISTUTILS=yes
PYDISTUTILS_PKGVERSION=	0.0.0
WRKSRC=		${PYTHON_WRKSRC}/Modules
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 300
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
