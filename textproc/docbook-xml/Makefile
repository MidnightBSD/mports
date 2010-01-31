# New ports collection makefile for:	DocBook XML DTD
# Date created:		28 March 1999
# Whom:			kuriyama
#
# $MidnightBSD: mports/textproc/docbook-xml/Makefile,v 1.3 2008/05/31 17:39:18 laffer1 Exp $
# $FreeBSD: ports/textproc/docbook-xml/Makefile,v 1.24 2004/04/19 09:13:36 kris Exp $
#

PORTNAME=	docbook-xml
PORTVERSION=	4.2
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://www.docbook.org/xml/${PORTVERSION}/ \
		http://www.oasis-open.org/committees/docbook/xml/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML version of the DocBook DTD
LICENSE=	unknown

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

BUILD_DEPENDS=	${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip
USE_ZIP=	YES
NO_BUILD=	YES
NO_WRKSUBDIR=	YES
PLIST_SUB=	DTD_VERSION=${PORTVERSION} \
		XMLCATMGR=${XMLCATMGR}\
		DOCBOOKDIR=${DOCBOOKDIR}\
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_PORTS_XML=${CATALOG_PORTS_XML}

DOCBOOKDIR=	${PREFIX}/share/xml/${PORTNAME:S/-xml//}/${PORTVERSION}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${PREFIX}/share/xml/catalog.ports

pre-install:
	@[ -d ${DOCBOOKDIR}/ent ] || ${MKDIR} ${DOCBOOKDIR}/ent

do-install:
	for file in `${LOCALBASE}/bin/unzip -l ${DISTDIR}/${DISTFILES}|${AWK} '/:[0-9].*[^\/]$$/{print $$4}'`; do \
		${INSTALL_DATA} ${WRKSRC}/$$file ${DOCBOOKDIR}/$$file; \
	done


.include <bsd.port.mk>
