# Created by: Thomas Gellekum <tg@FreeBSD.org>

PORTNAME=	gdbm
DISTVERSION=	${PYTHON_DISTVERSION}
PORTREVISION=	4
CATEGORIES=	databases python
MASTER_SITES=	PYTHON/ftp/python/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings to the GNU dbm library (Python ${PYTHON_VER})

LICENSE=	python

LIB_DEPENDS=	libgdbm.so:databases/gdbm

PORTSCOUT=	ignore:1

USES=		compiler:c11 python tar:xz
USE_PYTHON=	distutils autoplist allflavors

PYDISTUTILS_INSTALLARGS+=	--install-lib ${PYTHONPREFIX_LIBDIR}/lib-dynload

DIST_SUBDIR=	python
DISTINFO_FILE=	${PORTSDIR}/lang/python${PYTHON_SUFFIX}/distinfo
WRKSRC_SUBDIR=	Modules

post-extract:
	@${CP} ${FILESDIR}/setup3.py ${WRKSRC}/setup.py

.include <bsd.port.mk>
