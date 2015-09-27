# $MidnightBSD$

PORTNAME=	gobject
PORTVERSION=	2.28.6
PORTREVISION=	5
CATEGORIES=	devel python
MASTER_SITES=	GNOME/sources/pygobject/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygobject-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for GObject

LICENSE=	lgpl2.1

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pycairo.pc:${PORTSDIR}/graphics/py-cairo
LIB_DEPENDS+=	libffi.so:${PORTSDIR}/devel/libffi
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pycairo.pc:${PORTSDIR}/graphics/py-cairo

PORTSCOUT=	ignore:1

USES=		gmake libtool pathfix pkgconfig python:2 tar:xz
USE_GNOME=	glib20 introspection:build,run
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-docs --disable-introspection --with-ffi
INSTALL_TARGET=	install-strip

CONFLICTS=	py*-gtk-0*
PLIST_SUB=	PYTHON_VER="${PYTHON_VER}"

SKIP_FAKE_CHECK=.*\.py[co]
PYSHAREDIR=	${PREFIX}/share/pygobject/2.0/codegen

post-install:
	cd ${PREFIX} && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYSHAREDIR} -f ${PYSHAREDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYSHAREDIR} -f ${PYSHAREDIR:S;${TRUE_PREFIX}/;;}

.include <bsd.port.mk>
