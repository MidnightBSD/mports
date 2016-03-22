# $MidnightBSD$
# $FreeBSD: ports/graphics/py-clutter/Makefile,v 1.17 2011/09/23 22:23:25 amdmi3 Exp $
#   $MCom: ports/graphics/py-clutter/Makefile,v 1.8 2010/08/26 21:06:34 marcus Exp $
#

PORTNAME=	clutter
PORTVERSION=	1.0.2
CATEGORIES=	graphics python
MASTER_SITES=	http://www.clutter-project.org/sources/pyclutter/${PORTVERSION:R}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python modules for Clutter toolkit

LICENSE=	python

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo
LIB_DEPENDS=	clutter-glx-1.0:${PORTSDIR}/graphics/clutter

USES=		tar:bzip2 gmake gettext libtool python:2
USE_GNOME=	pygnome2 pygtk2
CONFIGURE_ARGS=	--disable-docs

CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.include <bsd.port.mk>
