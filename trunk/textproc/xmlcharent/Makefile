# $MidnightBSD$
# $FreeBSD: ports/textproc/xmlcharent/Makefile,v 1.7 2006/07/14 16:32:39 hrs Exp $

PORTNAME=	xmlcharent
PORTVERSION=	0.3
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/${PORTNAME}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML character entities

LICENSE=	unknown

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USES=		zip
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
PLIST_SUB=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	XMLDIR=${XMLDIR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}
PLIST_SUB+=	CATALOG_PORTS_XML=${CATALOG_PORTS_XML}

XMLDIR=		${PREFIX}/share/xml/${PORTNAME}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${TRUE_PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${TRUE_PREFIX}/share/xml/catalog.ports

do-install:
	${MKDIR} ${XMLDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ent\
		${FILESDIR}/catalog ${FILESDIR}/catalog.xml ${XMLDIR}

.include <bsd.port.mk>
