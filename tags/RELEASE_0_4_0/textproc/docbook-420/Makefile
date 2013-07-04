# New ports collection makefile for:	docbook-420
# Date created:		29 Oct 2003
# Whom:			kutulu
#
# Based on murray's docbook-410 port
#     which is based on niks' docbook-310 port
#
# $MidnightBSD: mports/textproc/docbook-420/Makefile,v 1.3 2007/09/06 14:03:04 ctriv Exp $
# $FreeBSD: ports/textproc/docbook-420/Makefile,v 1.2 2004/04/19 09:16:07 kris Exp $
#

PORTNAME=	docbook
PORTVERSION=	4.2
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://www.docbook.org/sgml/4.2/
EXTRACT_ONLY=	# empty
PKGNAMESUFFIX=	420

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V4.2 of the DocBook DTD, designed for technical documentation
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

LATEST_LINK=	docbook-420

pre-install:
	@[ -d ${INSTDIR}/${PORTVERSION} ] || ${MKDIR} ${INSTDIR}/${PORTVERSION}

do-install:
	@unzip -a -q -o ${DISTDIR}/${DISTFILES} -d ${INSTDIR}/${PORTVERSION}
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/${PORTVERSION}/catalog
	@${ECHO_CMD} "CATALOG \"${ISOCAT}\"" >> ${INSTDIR}/${PORTVERSION}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/${PORTVERSION}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
