# $MidnightBSD: mports/databases/py-gdbm/Makefile,v 1.3 2011/05/27 02:40:14 laffer1 Exp $

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

LIB_DEPENDS=	gdbm.4:${PORTSDIR}/databases/gdbm

PLIST_FILES=	%%PYTHON_SITELIBDIR%%/gdbm.so
DIST_SUBDIR=	python
USE_PYTHON=	yes
USE_PYDISTUTILS=yes
USE_XZ=		yes
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
