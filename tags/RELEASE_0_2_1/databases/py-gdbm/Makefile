# New ports collection makefile for:    py-gdbm
# Date created:         03 October 2000
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/py-gdbm/Makefile,v 1.13 2007/07/30 09:41:05 alexbl Exp $
#

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
MD5_FILE=	${PORTSDIR}/lang/python/distinfo

post-extract:
	@${CP} ${FILESDIR}/setup.py ${WRKSRC}

.include <bsd.port.mk>
