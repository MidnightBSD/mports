# $MidnightBSD$
# $FreeBSD: ports/textproc/sdocbook-xml/Makefile,v 1.7 2004/02/13 10:31:54 des Exp $

PORTNAME=	sdocbook-xml
PORTVERSION= 	1.1
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/xml/simple/${PORTVERSION}/
DISTNAME=	docbook-simple-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	"Simplified" DocBook XML DTD

LICENSE=	unknown

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USES=		zip
NO_BUILD=	yes
WRKSRC=		${WRKDIR}
PLIST_SUB=	XMLCATMGR=${XMLCATMGR}\
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}\
		CATALOG_PORTS_XML=${CATALOG_PORTS_XML}\
		XMLDIR=${SDOCBOOKDIR}\
		VERSION=${PORTVERSION}

SDOCBOOKDIR=	${PREFIX}/share/xml/${PORTNAME:S/-xml//}/${PORTVERSION}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${PREFIX}/share/xml/catalog.ports

FILES=		sdbcent.mod sdbhier.mod sdbpool.mod sdocbook-custom.dtd \
		sdocbook.css sdocbook.dtd sdocbookref-custom.dtd \
		sdocbookref.dtd sinclist.mod

do-extract:
	${MKDIR} ${WRKDIR}; \
	(cd ${WRKDIR} && unzip -oq ${DISTDIR}/${DISTFILES})

post-patch:
	${SED} -e 's#@@DTDDIR@@#${SDOCBOOKDIR}#' < ${FILESDIR}/catalog.xml > ${WRKSRC}/catalog.xml

do-install:
	${MKDIR} ${SDOCBOOKDIR}
.for i in ${FILES}
	${INSTALL_DATA} $(WRKDIR)/${i} ${SDOCBOOKDIR}
.endfor
	${INSTALL_DATA} ${FILESDIR}/catalog ${SDOCBOOKDIR}
	${INSTALL_DATA} ${WRKDIR}/catalog.xml ${SDOCBOOKDIR}


.include <bsd.port.mk>
