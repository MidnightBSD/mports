# $MidnightBSD: mports/textproc/docbook-300/Makefile,v 1.3 2007/09/06 13:53:21 ctriv Exp $
# $FreeBSD: ports/textproc/docbook-300/Makefile,v 1.19 2006/04/15 06:46:10 linimon Exp $

PORTNAME=	docbook
PORTVERSION=	3.0
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.ora.com/pub/davenport/
DISTFILES=	docbk30.tar.Z
EXTRACT_ONLY=	# empty
PKGNAMESUFFIX=	300

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V3.0 of the DocBook DTD, designed for technical documentation
LICENSE=	unknown

RUN_DEPENDS=	${ISOCAT}:${PORTSDIR}/textproc/iso8879 \
		${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

NO_MTREE=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME}
PLIST_SUB+=	DTD_VERSION=${PORTVERSION}
PLIST_SUB+=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/docbook
ISOCAT=		${TRUE_PREFIX}/share/sgml/iso8879/catalog
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

LATEST_LINK=	docbook-${PORTVERSION}

pre-install:
	@[ -d ${INSTDIR}/${PORTVERSION} ] || ${MKDIR} ${INSTDIR}/${PORTVERSION}

do-install:
	@zcat ${DISTDIR}/docbk30.tar.Z | \
		(cd ${INSTDIR}/${PORTVERSION}; ${PAX} -r)
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/${PORTVERSION}/catalog
	@${ECHO_CMD} "CATALOG \"${ISOCAT}\"" >> ${INSTDIR}/${PORTVERSION}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/${PORTVERSION}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
