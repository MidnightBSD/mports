PORTNAME=	gtk-doc
DISTVERSION=	1.33.2
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code documentation system, originally for GTK
WWW=		https://www.gtk.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR} \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl \
		itstool:textproc/itstool \
		yelp-tools>=0:textproc/yelp-tools \
		xsltproc:textproc/libxslt
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR} \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl \
		xsltproc:textproc/libxslt

USES=		gettext-tools meson python pkgconfig tar:xz

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
