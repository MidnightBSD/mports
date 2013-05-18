# $MidnightBSD: mports/devel/py-gobject/Makefile,v 1.8 2012/02/29 03:02:43 laffer1 Exp $

PORTNAME=	gobject
PORTVERSION=	2.28.6
PORTREVISION=	1
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

USE_XZ=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_PYTHON=	2.5+
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_PKGCONFIG=	build
CONFIGURE_ARGS=	--disable-docs --disable-introspection --with-ffi
PLIST_SUB=	PYTHON_VER="${PYTHON_VER}"

CONFLICTS=	py*-gtk-0*

SKIP_FAKE_CHECK=.*\.py[co]

post-install:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		${PREFIX}/share/pygobject/2.0/codegen

.include <bsd.port.mk>
