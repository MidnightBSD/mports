# New ports collection makefile for:	linuxdoc
# Date created:		July 8, 1997
# Whom:			jfieber
#
# $MidnightBSD: mports/textproc/linuxdoc/Makefile,v 1.1 2006/09/24 03:04:16 laffer1 Exp $
# $FreeBSD: ports/textproc/linuxdoc/Makefile,v 1.19 2005/07/13 02:38:23 kuriyama Exp $
#

PORTNAME=	linuxdoc
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://dist.bsdlab.org/ \
		http://fallout.campusview.indiana.edu/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Linuxdoc SGML DTD

RUN_DEPENDS=	${ISOCAT}:${PORTSDIR}/textproc/iso8879 \
		${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

EXTRACT_ONLY=	# empty
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

PLIST_SUB=	DTD_NAME=${PORTNAME} XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/linuxdoc
ISOCAT=		${PREFIX}/share/sgml/iso8879/catalog
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

pre-install:
	@[ -d ${INSTDIR} ] || ${MKDIR} ${INSTDIR}

do-install:
	@zcat ${DISTDIR}/${DISTFILES} |(cd ${INSTDIR}; ${PAX} -r)
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
