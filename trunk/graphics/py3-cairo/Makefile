# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.14.1
CATEGORIES=	graphics python
MASTER_SITES=	https://github.com/pygobject/pycairo/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3 bindings for Cairo

LICENSE=	lgpl

PORTSCOUT=	limitw:1,even

USES=		gnome pkgconfig python:3
USE_PYTHON=	distutils py3kplist
USE_GNOME=	cairo

PLIST_SUB=	PORTVER=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cairo/_cairo.so
	${CP} ${PREFIX}/lib/pkgconfig/* ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
