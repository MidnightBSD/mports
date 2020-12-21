PORTNAME=	gtk-doc
PORTVERSION=	1.29
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code documentation system, originally for GTK+

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool \
		highlight:textproc/highlight \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl
RUN_DEPENDS=	highlight:textproc/highlight \
		docbook-xml>0:textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:textproc/docbook-xsl

DOCBOOK_VERSION=	4.1.2

CATALOG_DIR=		${PREFIX}/share/sgml/${PORTNAME}
XMLCATMGR=		${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

USES=		gettext-tools gmake gnome pathfix perl5 pkgconfig python:3.4+ tar:xz
USE_GNOME=	gnomeprefix libxslt
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-highlight=highlight \
		--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports

PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_DIR=${CATALOG_DIR}

post-install:
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc
	${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-f -d ${DATADIR}/python/gtkdoc \
		${STAGEDIR}${DATADIR}/python/gtkdoc

.include <bsd.port.mk>
