# $MidnightBSD$

PORTNAME=	gtk-doc
PORTVERSION=	1.21
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code documentation system, originally for GTK+

LICENSE=	gpl2

BUILD_DEPENDS=	jade:${PORTSDIR}/textproc/jade \
		itstool:${PORTSDIR}/textproc/itstool \
		docbook-xml>0:${PORTSDIR}/textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	jade:${PORTSDIR}/textproc/jade \
		docbook-xml>0:${PORTSDIR}/textproc/docbook-xml \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		rarian-sk-config:${PORTSDIR}/textproc/rarian

DOCBOOK_VERSION=	4.1.2

CATALOG_DIR=		${PREFIX}/share/sgml/${PORTNAME}
XMLCATMGR=		${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

USES=		gmake gettext-tools pathfix perl5 pkgconfig python tar:xz
USE_GNOME=	gnomeprefix libxslt
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports

PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_DIR=${CATALOG_DIR}

.include <bsd.port.mk>
