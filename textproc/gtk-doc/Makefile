# Created by: fenner

PORTNAME=	gtk-doc
DISTVERSION=	1.33.2
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code documentation system, originally for GTK+

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PY_PYGMENTS} \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl \
		itstool:textproc/itstool \
		yelp-tools>=0:textproc/yelp-tools
RUN_DEPENDS=	${PY_PYGMENTS} \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl

USES=		gettext-tools gnome meson python:3.6+ pkgconfig tar:xz
USE_GNOME=	libxml2 libxslt

MESON_ARGS=	-Dtests=false

PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_DIR=${CATALOG_DIR}


NO_ARCH=	yes

post-install:
	${PYTHON_CMD:S,${FAKE_DESTDIR},,} ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc
	${PYTHON_CMD:S,${FAKE_DESTDIR},,} -O ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc

.include <bsd.port.mk>
