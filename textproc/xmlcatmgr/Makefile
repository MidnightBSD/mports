PORTNAME=	xmlcatmgr
PORTVERSION=	2.2
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SGML and XML catalog manager
WWW=		https://xmlcatmgr.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	DEFAULT_CATALOG_SGML=${CATALOG_PORTS_SGML} \
		DEFAULT_CATALOG_XML=${CATALOG_PORTS_XML}
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall
SUB_FILES=	pkg-install \
		pkg-deinstall \
		pkg-message
SUB_LIST=	XMLCATMGR=${XMLCATMGR} \
		CATALOG_MASTER_SGML=${CATALOG_MASTER_SGML} \
		CATALOG_MASTER_XML=${CATALOG_MASTER_XML} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_PORTS_XML=${CATALOG_PORTS_XML}
PLIST_FILES=	bin/xmlcatmgr share/man/man1/xmlcatmgr.1.gz
PLIST_DIRS=	share/xml share/sgml
PORTDOCS=	AUTHORS COPYING NEWS README TODO

XMLCATMGR?=		${PREFIX}/bin/xmlcatmgr
CATALOG_MASTER_SGML?=	${PREFIX}/share/sgml/catalog
CATALOG_PORTS_SGML?=	${PREFIX}/share/sgml/catalog.ports
CATALOG_MASTER_XML?=	${PREFIX}/share/xml/catalog
CATALOG_PORTS_XML?=	${PREFIX}/share/xml/catalog.ports

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=	--disable-docs
.endif

.include <bsd.port.mk>
