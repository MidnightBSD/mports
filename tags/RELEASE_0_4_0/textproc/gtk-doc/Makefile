# $MidnightBSD: mports/textproc/gtk-doc/Makefile,v 1.3 2011/06/01 01:49:03 laffer1 Exp $

PORTNAME=	gtk-doc
PORTVERSION=	1.15
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	GNOME

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Code documentation system, originally for GTK+
LICENSE=	gpl2

BUILD_DEPENDS=	jade:${PORTSDIR}/textproc/jade \
		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/docbook.cat:${PORTSDIR}/textproc/docbook-sk \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	jade:${PORTSDIR}/textproc/jade \
		${LOCALBASE}/share/xml/docbook/${DOCBOOK_VERSION}/docbook.cat:${PORTSDIR}/textproc/docbook-sk \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		rarian-sk-config:${PORTSDIR}/textproc/rarian

DOCBOOK_VERSION=	4.1.2

CATALOG_DIR=		${PREFIX}/share/sgml/${PORTNAME}
XMLCATMGR=		${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

USE_BZIP2=	yes
USE_PERL5=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack gnomeprefix libxslt gnomedocutils
INSTALLS_OMF=	yes
CONFIGURE_ARGS=	--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports

PLIST_SUB=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_DIR=${CATALOG_DIR}

.include <bsd.port.mk>
