# New ports collection makefile for:	xhtml-basic
# Date created:		Dec 2, 2003
# Whom:			nectar
#
# $MidnightBSD: mports/textproc/xhtml-basic/Makefile,v 1.3 2008/04/04 05:01:25 ctriv Exp $
# $FreeBSD: ports/textproc/xhtml-basic/Makefile,v 1.3 2006/03/24 05:44:38 linimon Exp $
#

PORTNAME=	xhtml-basic
PORTVERSION=	1.0.${RECDATE}
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://www.w3.org/TR/2000/REC-${PORTNAME}-${RECDATE}/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	W3C's XHTML Basic DTD
LICENSE=	unknown

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr \
		${LOCALBASE}/share/xml/dtd/xhtml-modularization/catalog.xml:${PORTSDIR}/textproc/xhtml-modularization

RECDATE=	20001219

NO_BUILD=	YES
WRKSRC=		${WRKDIR}/REC-${PORTNAME}-${RECDATE}


PLIST=		${WRKDIR}/PLIST
dir_DTD=	share/xml/dtd/xhtml-basic
dir_DOC=	share/doc/xhtml-basic

XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
SGMLCAT=	${LOCALBASE}/share/sgml/catalog.ports
XMLCAT=		${LOCALBASE}/share/xml/catalog.ports

XMLCAT_ADD=	${XMLCATMGR} -c ${XMLCAT} add nextCatalog \
		    ${LOCALBASE}/${dir_DTD}/catalog.xml
XMLCAT_RM=	${XMLCATMGR} -c ${XMLCAT} remove \
		    ${LOCALBASE}/${dir_DTD}/catalog.xml
SGMLCAT_ADD=	${XMLCATMGR} -sc ${SGMLCAT} add CATALOG \
		    ${LOCALBASE}/${dir_DTD}/xhtml-basic10.cat
SGMLCAT_RM=	${XMLCATMGR} -sc ${SGMLCAT} remove \
		    ${LOCALBASE}/${dir_DTD}/xhtml-basic10.cat

CATALOG_PORTS_SGML=	${LOCALBASE}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${LOCALBASE}/share/xml/catalog.ports

SUB_FILES= catalog.xml	

.include "${.CURDIR}/contents.inc"

# I'd much rather do this stuff in line with the actual installation
# in do-install, but the PLIST must be generated in pre-install.
pre-fake:
	${CAT} /dev/null > ${PLIST}
.for f in ${contents_DTD}
	${ECHO} ${dir_DTD}/${f} >> ${PLIST}
.endfor
.for f in ${contents_DOC}
	${ECHO} ${dir_DOC}/${f} >> ${PLIST}
.endfor
	${ECHO} ${dir_DTD}/catalog.xml >> ${PLIST}
	${ECHO} "@unexec ${XMLCAT_RM}" >> ${PLIST}
	${ECHO} "@exec ${XMLCAT_ADD}" >> ${PLIST}
	${ECHO} "@unexec ${SGMLCAT_RM}" >> ${PLIST}
	${ECHO} "@exec ${SGMLCAT_ADD}" >> ${PLIST}
	${ECHO} "@dirrm ${dir_DTD}" >> ${PLIST}
	${ECHO} '@unexec rmdir %D share/xml/dtd 2>/dev/null || true' >> \
	    ${PLIST}
	${ECHO} "@dirrm ${dir_DOC}" >> ${PLIST}

pre-fake:

do-install:
	@${MKDIR} ${PREFIX}/${dir_DTD}
	@${MKDIR} ${PREFIX}/${dir_DOC}
.for f in ${contents_DTD}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${dir_DTD}/${f}
.endfor
.for f in ${contents_DOC}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${dir_DOC}/${f}
.endfor
	${INSTALL_DATA} ${WRKDIR}/catalog.xml ${PREFIX}/${dir_DTD}/catalog.xml
	${MKDIR} ${PREFIX}/share/sgml
	${MKDIR} ${PREFIX}/share/xml
	${TOUCH} ${CATALOG_PORTS_SGML}
	${TOUCH} ${CATALOG_PORTS_XML}


.include <bsd.port.mk>
