# New ports collection makefile for:	docbook
# Date created:		7 April 1997
# Whom:			nik
#
# Based heavily on work by jfieber.
#
# $MidnightBSD: mports/textproc/docbook-241/Makefile,v 1.2 2007/05/09 15:22:04 ctriv Exp $
# $FreeBSD: ports/textproc/docbook-241/Makefile,v 1.18 2006/04/15 06:46:10 linimon Exp $
#

PORTNAME=	docbook
PORTVERSION=	241
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.ora.com/pub/davenport/
DISTFILES=	docbk241.tar.Z
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V2.4.1 of the DocBook DTD, designed for technical documentation
LICENSE=	unknown

RUN_DEPENDS=	${ISOCAT}:${PORTSDIR}/textproc/iso8879 \
		${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

NO_MTREE=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME}
PLIST_SUB+=	DTD_VERSION=${DTD_VERSION}
PLIST_SUB+=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/docbook
ISOCAT=		${TRUE_PREFIX}/share/sgml/iso8879/catalog
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
DTD_VERSION=	2.4.1

LATEST_LINK=	docbook-241

pre-install:
	@[ -d ${INSTDIR}/${DTD_VERSION} ] || ${MKDIR} ${INSTDIR}/${DTD_VERSION}

do-install:
	@zcat ${DISTDIR}/docbk241.tar.Z | \
		(cd ${INSTDIR}/${DTD_VERSION}; ${PAX} -r)
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/${DTD_VERSION}/catalog
	@${ECHO} "CATALOG \"${ISOCAT}\"" >> ${INSTDIR}/${DTD_VERSION}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/${DTD_VERSION}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
