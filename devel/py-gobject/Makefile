# $MidnightBSD: mports/devel/py-gobject/Makefile,v 1.6 2011/05/30 14:26:15 laffer1 Exp $
# $FreeBSD: ports/devel/py-gobject/Makefile,v 1.5 2006/11/18 20:38:02 marcus Exp $

PORTNAME=	gobject
PORTVERSION=	2.28.6
CATEGORIES=	devel python
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pygobject/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygobject-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for GObject
LICENSE=	lgpl

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection \
		${LOCALBASE}/libdata/pkgconfig/pycairo.pc:${PORTSDIR}/graphics/py-cairo
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection \
		${LOCALBASE}/libdata/pkgconfig/pycairo.pc:${PORTSDIR}/graphics/py-cairo

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-docs --enable-ffi
PLIST_SUB=	PYTHON_VER="${PYTHON_VER}"

CONFLICTS=	py*-gtk-0*

SKIP_FAKE_CHECK=.*\.py[co]

post-install:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		${PREFIX}/share/pygobject/2.0/codegen

.include <bsd.port.mk>
