# New ports collection makefile for:	DocBook XML for ScrollKeeper
# Date created:		16 January 2003
# Whom:			marcus@FreeBSD.org
#
# $MidnightBSD: mports/textproc/docbook-sk/Makefile,v 1.3 2007/05/08 00:29:08 ctriv Exp $
# $FreeBSD: ports/textproc/docbook-sk/Makefile,v 1.27 2005/02/14 08:43:48 pav Exp $
#

PORTNAME=	docbook-sk
PORTVERSION=	4.1.2
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/xml/${PORTVERSION}/
DISTNAME=	docbkx${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML version of the DocBook DTD version controlled for ScrollKeeper
LICENSE=	unknown

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USE_ZIP=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_VERSION=${PORTVERSION} \
		XMLCATMGR=${XMLCATMGR} \
		DOCBOOKDIR=${DOCBOOKDIR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML} \
		CATALOG_PORTS_XML=${CATALOG_PORTS_XML}

DOCBOOKDIR=	${PREFIX}/share/xml/${PORTNAME:S/-sk//}/${PORTVERSION}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${TRUE_PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${TRUE_PREFIX}/share/xml/catalog.ports

pre-install:
	@[ -d ${DOCBOOKDIR}/ent ] || ${MKDIR} ${DOCBOOKDIR}/ent

do-install:
	for file in `${FIND} ${WRKSRC} -type f | ${SED} -e 's|^${WRKSRC}/||' | ${GREP} -v '^\.' | ${SORT}`; do \
		${ECHO_MSG} "${INSTALL_DATA} ${WRKSRC}/$$file ${DOCBOOKDIR}/"; \
		${INSTALL_DATA} ${WRKSRC}/$$file ${DOCBOOKDIR}/$$file; \
	done

.include <bsd.port.mk>
