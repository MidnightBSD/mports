# $MidnightBSD$

PORTNAME=	gobject
PORTVERSION=	2.28.6
PORTREVISION=	2
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
LIB_DEPENDS+=	libffi.so:${PORTSDIR}/devel/libffi
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection \
		${LOCALBASE}/libdata/pkgconfig/pycairo.pc:${PORTSDIR}/graphics/py-cairo

USES=		gmake pathfix pkgconfig
USE_XZ=		yes
USE_GNOME=	glib20
USE_PYTHON=	2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-docs --disable-introspection --with-ffi

CONFLICTS=	py*-gtk-0*
PLIST_SUB=	PYTHON_VER="${PYTHON_VER}"

SKIP_FAKE_CHECK=.*\.py[co]

post-install:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		${STAGEDIR}${PREFIX}/share/pygobject/2.0/codegen

.for l in glib/_glib gobject/_gobject gtk-2.0/gio/_gio gtk-2.0/gio/unix
	${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/${l}.so
.endfor
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libpyglib-2.0-python${PYTHON_VER}.so.0

.include <bsd.port.mk>
