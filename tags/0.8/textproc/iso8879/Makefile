# New ports collection makefile for:	iso8879
# Date created:		June 19, 1997
# Whom:			jfieber
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/iso8879/Makefile,v 1.22 2005/06/13 20:54:18 glewis Exp $
#

PORTNAME=	iso8879
PORTVERSION=	1986
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama
DISTNAME=	isoENTS
EXTRACT_SUFX=	.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character entity sets from ISO 8879:1986 (SGML)
LICENSE=	unknown

BUILD_DEPENDS=	unzip:${PORTSDIR}/archivers/unzip
RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

EXTRACT_ONLY=	# empty
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME} XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/iso8879
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

pre-install:
	@[ -d ${INSTDIR} ] || ${MKDIR} ${INSTDIR}

do-install:
	@unzip -a -q -o ${DISTDIR}/${DISTFILES} -d ${INSTDIR}
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}


.include <bsd.port.mk>
