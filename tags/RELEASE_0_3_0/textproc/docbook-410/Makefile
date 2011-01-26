# New ports collection makefile for:	docbook-410
# Date created:		26 June 2000
# Whom:			murray
#
# Based on nik's docbook-310 port
#
# $MidnightBSD: mports/textproc/docbook-410/Makefile,v 1.2 2007/05/09 15:25:23 ctriv Exp $
# $FreeBSD: ports/textproc/docbook-410/Makefile,v 1.11 2005/06/01 19:54:03 glewis Exp $
#

PORTNAME=	docbook
PORTVERSION=	4.1
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	http://www.docbook.org/sgml/4.1/
DISTNAME=	docbk41
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V4.1 of the DocBook DTD, designed for technical documentation
LICENSE=	unknown

RUN_DEPENDS=	${ISOCAT}:${PORTSDIR}/textproc/iso8879 \
		${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

BUILD_DEPENDS=	unzip:${PORTSDIR}/archivers/unzip
USE_ZIP=	yes
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

LATEST_LINK=	docbook-410

pre-install:
	@[ -d ${INSTDIR}/${PORTVERSION} ] || ${MKDIR} ${INSTDIR}/${PORTVERSION}

do-install:
	@unzip -a -q -o ${DISTDIR}/${DISTFILES} -d ${INSTDIR}/${PORTVERSION}
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/${PORTVERSION}/catalog
	@${ECHO_CMD} "CATALOG \"${ISOCAT}\"" >> ${INSTDIR}/${PORTVERSION}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/${PORTVERSION}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
