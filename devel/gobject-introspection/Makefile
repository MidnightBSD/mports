# Created by: Alexander Logvinov <avl@FreeBSD.org>

PORTNAME=	gobject-introspection
DISTVERSION=	1.72.0
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate interface introspection data for GObject libraries

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi

# we need cairo otherwise the generated Cairo gir is broken
BUILD_DEPENDS=	cairo-trace:graphics/cairo
LIB_DEPENDS=	libffi.so:devel/libffi

PORTSCOUT=	limitw:1,even

USES=		bison gettext gnome localbase meson pkgconfig python:3.7+ tar:xz
BINARY_ALIAS=	python3=${PYTHON_CMD}
USE_GNOME=	glib20
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddoctool=disabled \
		-Dpython=${PYTHON_CMD}

post-patch:
	@${REINPLACE_CMD} -e 's|%%PYTHON_CMD%%|${PYTHON_CMD}|' ${WRKSRC}/tools/meson.build

post-fake:
	@${PYTHON_CMD} -m compileall -d ${PREFIX}/lib/${PORTNAME} \
		"${FAKE_DESTDIR}${PREFIX}/lib/${PORTNAME}"
	@${PYTHON_CMD} -O -m compileall -d ${PREFIX}/lib/${PORTNAME} \
		"${FAKE_DESTDIR}${PREFIX}/lib/${PORTNAME}"

.include <bsd.port.mk>
