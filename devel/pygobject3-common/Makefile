PORTNAME=	gobject
PORTVERSION=	3.38.0
PORTREVISION=	0
CATEGORIES=	devel python
MASTER_SITES=	GNOME/sources/pygobject/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX?=	py
PKGNAMESUFFIX?=	3-common
DISTNAME=	pygobject-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common files for the Python bindings for GObject

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

SLAVE_PORT?=	no

USES=		meson pkgconfig tar:xz

NO_TEST=	yes

# this port doesn't work with py-gobject < 2.28.6_2, clungle below
CONFLICTS=	py*-gtk-0* py*-gobject-2.*.[0-6] py*-gobject-2.*.[7-9] \
		py*-gobject-2.*.6_1

SKIP_FAKE_CHECK=.*\.py[co]

PLIST_SUB=	ARCH=${ARCH} UNAME_R=${UNAME_R} VERSION=${PORTVERSION} \
		OPSYS=${OPSYS:tl} UNAME_M=${UNAME_M}

BINARY_ALIAS=	python3=${PYTHON_CMD}

.if ${SLAVE_PORT} == no
PORTSCOUT?=	limitw:1,even

BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR}
USES+=		gnome python:build
USE_GNOME=	glib20:build introspection:build
NO_BUILD=	yes

do-install:
	@${MKDIR} ${PREFIX}/include/pygobject-3.0/
	${INSTALL_DATA} ${WRKSRC}/gi/pygobject.h \
		${PREFIX}/include/pygobject-3.0/pygobject.h
	${INSTALL_DATA} ${WRKSRC}/_build/pygobject-3.0.pc \
		${PREFIX}/libdata/pkgconfig/pygobject-3.0.pc
.else
PORTSCOUT=	ignore:1

USES+=		gettext-runtime gnome
USE_GNOME+=	cairo glib20 introspection
LIB_DEPENDS+=	libffi.so:devel/libffi
RUN_DEPENDS+=	pygobject3-common>=0:devel/pygobject3-common

.  if ${SLAVE_PORT} == python
USES+=		python:3.6+
USE_PYTHON=	flavors py3kplist
MESON_ARGS+=	-Dpython=${PYTHON_VERSION}
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR}
.  endif

PYTHON_CMD3=	${BINARY_LINKDIR}/python3

post-install:
	@${RM} -r ${PREFIX}/include/pygobject-3.0 \
		${PREFIX}/libdata/pkgconfig/pygobject-3.0.pc
	cd ${PREFIX} && ${PYTHON_CMD3} ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD3} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD3} ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYSHAREDIR} -f ${PYSHAREDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD3} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${FAKE_DESTDIR}${PYSHAREDIR} -f ${PYSHAREDIR:S;${TRUE_PREFIX}/;;}
.endif

.include <bsd.port.pre.mk>

UNAME_R!=	${UNAME} -r
UNAME_M!=	${UNAME} -m

.include <bsd.port.post.mk>
