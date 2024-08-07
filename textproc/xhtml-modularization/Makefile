PORTNAME=	xhtml-modularization
PORTVERSION=	1.0.${RECDATE}
CATEGORIES=	textproc
MASTER_SITES=	https://www.w3.org/TR/2001/REC-${PORTNAME}-${RECDATE}/
DISTNAME=	xhtml-modularization
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	W3C's Modularization of XHTML DTDs and docs #'
WWW=		https://www.w3.org/TR/xhtml-modularization/

LICENSE=	W3C_DOCUMENT_LICENSE
LICENSE_NAME=	W3C Document License
LICENSE_TEXT=	See https://www.w3.org/copyright/document-license/ for detail
LICENSE_PERMS=	auto-accept dist-mirror dist-sell pkg-mirror pkg-sell

RUN_DEPENDS=	${XMLCATMGR}:textproc/xmlcatmgr

RECDATE=	20010410

NO_MTREE=	YES
NO_BUILD=	YES
WRKSRC=		${WRKDIR}/${PORTNAME}-${RECDATE}

PLIST=		${WRKDIR}/PLIST
dir_DTD=	share/xml/dtd/xhtml-modularization
dir_DOC=	share/doc/xhtml-modularization
dir_EXAMPLES=	share/examples/xhtml-modularization
dir_TEMPLATES=	share/examples/xhtml-modularization/templates

XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
SGMLCAT=	${PREFIX}/share/sgml/catalog.ports
XMLCAT=		${PREFIX}/share/xml/catalog.ports

XMLCAT_ADD=	${XMLCATMGR} -c ${XMLCAT} add nextCatalog \
		    ${PREFIX}/${dir_DTD}/catalog.xml
XMLCAT_RM=	${XMLCATMGR} -c ${XMLCAT} remove \
		    ${PREFIX}/${dir_DTD}/catalog.xml
SGMLCAT_ADD=	${XMLCATMGR} -sc ${SGMLCAT} add CATALOG \
		    ${PREFIX}/${dir_DTD}/xhtml.cat
SGMLCAT_RM=	${XMLCATMGR} -sc ${SGMLCAT} remove \
		    ${PREFIX}/${dir_DTD}/xhtml.cat

CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${PREFIX}/share/xml/catalog.ports

.include "${.CURDIR}/contents.inc"

pre-fake:
	${CAT} /dev/null > ${PLIST}
.for f in ${contents_DTD}
	${ECHO} ${dir_DTD}/${f} >> ${PLIST}
.endfor
.for f in ${contents_DOC}
	${ECHO} ${dir_DOC}/${f} >> ${PLIST}
.endfor
.for f in ${contents_EXAMPLES}
	${ECHO} ${dir_EXAMPLES}/${f} >> ${PLIST}
.endfor
.for f in ${contents_TEMPLATES}
	${ECHO} ${dir_TEMPLATES}/${f} >> ${PLIST}
.endfor
	${ECHO} ${dir_DTD}/catalog.xml >> ${PLIST}
	${ECHO} "@unexec ${XMLCAT_RM}" >> ${PLIST}
	${ECHO} "@exec ${XMLCAT_ADD}" >> ${PLIST}
	${ECHO} "@unexec ${SGMLCAT_RM}" >> ${PLIST}
	${ECHO} "@exec ${SGMLCAT_ADD}" >> ${PLIST}
	${ECHO} "@dirrm ${dir_DTD}" >> ${PLIST}
	${ECHO} '@dirrmtry share/xml/dtd' >> ${PLIST}
	${ECHO} "@dirrm ${dir_DOC}/images" >> ${PLIST}
	${ECHO} "@dirrm ${dir_DOC}" >> ${PLIST}
	${ECHO} "@dirrm ${dir_TEMPLATES}" >> ${PLIST}
	${ECHO} "@dirrm ${dir_EXAMPLES}" >> ${PLIST}

do-install:
	@[ -d ${PREFIX}/${dir_DTD} ] || \
	    ${MKDIR} ${PREFIX}/${dir_DTD}
	@[ -d ${PREFIX}/${dir_DOC}/images ] || \
	    ${MKDIR} ${PREFIX}/${dir_DOC}/images
	@[ -d ${PREFIX}/${dir_EXAMPLES} ] || \
	    ${MKDIR} ${PREFIX}/${dir_EXAMPLES}
	@[ -d ${PREFIX}/${dir_TEMPLATES} ] || \
	    ${MKDIR} ${PREFIX}/${dir_TEMPLATES}
.for f in ${contents_DTD}
	${INSTALL_DATA} ${WRKSRC}/DTD/${f} ${PREFIX}/${dir_DTD}/${f}
.endfor
.for f in ${contents_DOC}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${dir_DOC}/${f}
.endfor
.for f in ${contents_EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/DTD/examples/${f} \
	    ${PREFIX}/${dir_EXAMPLES}/${f}
.endfor
.for f in ${contents_TEMPLATES}
	${INSTALL_DATA} ${WRKSRC}/DTD/templates/${f} \
	    ${PREFIX}/${dir_TEMPLATES}/${f}
.endfor
	${SED} -e "s;@@PREFIX@@;${TRUE_PREFIX};g" ${FILESDIR}/catalog.xml > \
	    ${WRKDIR}/catalog.xml
	${INSTALL_DATA} ${WRKDIR}/catalog.xml ${PREFIX}/${dir_DTD}/catalog.xml

.include <bsd.port.mk>
