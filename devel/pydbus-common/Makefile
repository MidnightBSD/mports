PORTNAME=	dbus
DISTVERSION=	1.4.0
CATEGORIES=	devel gnome python
MASTER_SITES=	https://dbus.freedesktop.org/releases/dbus-python/
PKGNAMEPREFIX?=	py
PKGNAMESUFFIX?=	-common
DISTNAME=	dbus-python-${DISTVERSION}

PATCH_SITES=	https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/
PATCHFILES=	9b862b9fa6953aedc608813bc722f19f536d4fb5.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Common files for the Python bindings for the D-Bus messaging system
WWW=		https://dbus.freedesktop.org/doc/dbus-python/

LICENSE=	mit DBusGMain
LICENSE_COMB=	multi
LICENSE_NAME_DBusGMain=	Academic Free License 2.1 or GNU GPL version 2 or later
LICENSE_FILE_mit=	${WRKSRC}/COPYING
LICENSE_FILE_DBusGMain=	${FILESDIR}/LICENSE.dbus-gmain
LICENSE_PERMS_DBusGMain=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygobject>=0:devel/py-pygobject@${PY_FLAVOR}
LIB_DEPENDS=	libdbus-1.so:devel/dbus
TEST_DEPENDS=	bash:shells/bash

SLAVE_PORT?=	no

USES=		gnome meson pkgconfig shebangfix tar:xz
MESON_ARGS=	-Dpython=${PYTHON_CMD} -Dtests=enabled
SHEBANG_FILES=	test/run-test.sh test/*.py examples/*.py

.if ${SLAVE_PORT} == no
USES+=		python:build
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/glib-2.0.pc:devel/glib20

NO_ARCH=	yes
PORTDOCS=	*
PORTEXAMPLES=	*
DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

OPTIONS_DEFINE=	DOCS EXAMPLES HTMLDOCS
OPTIONS_SUB=	yes
HTMLDOCS_DESC=	Build HTML documentation
HTMLDOCS_IMPLIES=	DOCS
HTMLDOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>=0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR}
HTMLDOCS_MESON_ENABLED=	doc

# Keep the shared header, pkg-config file, docs and examples in this package.
do-install:
	${MKDIR} ${PREFIX}/include/dbus-1.0/dbus ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/include/dbus/dbus-python.h ${PREFIX}/include/dbus-1.0/dbus/
	${INSTALL_DATA} ${BUILD_WRKSRC}/meson-private/dbus-python.pc ${PREFIX}/libdata/pkgconfig/

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${WRKSRC}/README ${WRKSRC}/NEWS ${FAKE_DESTDIR}${DOCSDIR}/

do-install-HTMLDOCS-on:
	cd ${BUILD_WRKSRC}/doc/html && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} \
		"! -name .buildinfo -and ! -path '*.doctrees*'"

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.py ${FAKE_DESTDIR}${EXAMPLESDIR}/

.else
USES+=		python
USE_GNOME=	glib20
USE_PYTHON=	allflavors flavors
RUN_DEPENDS+=	pydbus-common>=1.4.0:devel/pydbus-common
MESON_ARGS+=	-Ddoc=disabled

# Meson installs these shared files unconditionally; pydbus-common owns them.
post-install:
	${RM} -r ${FAKE_DESTDIR}${TRUE_PREFIX}/include/dbus-1.0 \
		${FAKE_DESTDIR}${TRUE_PREFIX}/libdata/pkgconfig/dbus-python.pc
.endif

post-patch:
	${REINPLACE_CMD} -e 's|/bin/bash|/bin/sh|' ${WRKSRC}/test/TestSuitePythonService.service.in

.include <bsd.port.mk>
