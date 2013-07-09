# $MidnightBSD: mports/databases/py-gdbm/Makefile,v 1.4 2013/02/18 13:17:12 laffer1 Exp $

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

LIB_DEPENDS=	gdbm:${PORTSDIR}/databases/gdbm

USE_PYTHON=	yes
USE_PYDISTUTILS=yes
USE_XZ=		yes

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC=		${PYTHON_WRKSRC}/Modules

PYDISTUTILS_INSTALLARGS+=	--install-lib ${FAKE_DESTDIR}${PYTHON_LIBDIR}/lib-dynload

PYDISTUTILS_NOEGGINFO=	yes

PLIST_FILES=	%%PYTHON_LIBDIR%%/lib-dynload/gdbm.so

.include <bsd.port.pre.mk>

post-extract:
.if ${PYTHON_REL} < 300
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}
.else
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py
.endif

.include <bsd.port.post.mk>
