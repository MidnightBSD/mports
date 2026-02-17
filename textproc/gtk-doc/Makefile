PORTNAME=	gtk-doc
DISTVERSION=	1.35.1
CATEGORIES=	textproc
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnighBSD.org
COMMENT=	Documentation generator for GLib/GTK based code
WWW=		https://gitlab.gnome.org/GNOME/gtk-doc

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>0:textproc/py-pygments@${PY_FLAVOR} \
		docbook-xml>0:textproc/docbook-xml \
		docbook-xsl>0:textproc/docbook-xsl
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>0:textproc/py-pygments@${PY_FLAVOR} \
		docbook-xml>0:textproc/docbook-xml \
		docbook-xsl>0:textproc/docbook-xsl
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parameterized>0:devel/py-parameterized@${PY_FLAVOR}

USES=		gnome meson python pkgconfig tar:xz
USE_GNOME=	glib20 libxslt

MESON_ARGS=	-Dyelp_manual=false

PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_DIR=${CATALOG_DIR}


NO_ARCH=	yes
NO_TEST=	yes
TEST_ENV=	CC=${CC}
BINARY_ALIAS= python3=${PYTHON_CMD}

post-install:
	${PYTHON_CMD:S,${FAKE_DESTDIR},,} ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR:S,${FAKE_DESTDIR},,}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc
	${PYTHON_CMD:S,${FAKE_DESTDIR},,} -O ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR:S,${FAKE_DESTDIR},,}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc

.include <bsd.port.mk>
