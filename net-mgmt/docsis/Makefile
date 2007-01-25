# New ports collection makefile for:	docsis
# Date created:				Jul 5, 2002
# Whom:					James Flemer <jflemer@acm.jhu.edu>
#
# $FreeBSD: ports/net-mgmt/docsis/Makefile,v 1.10 2005/11/30 05:23:06 kuriyama Exp $
# $MidnightBSD$
#

PORTNAME=	docsis
PORTVERSION=	0.8.2
PORTREVISION=	4
CATEGORIES=	net-mgmt
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}-${PORTVERSION}-RELEASE
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DOCSIS(tm) binary configuration file encoder/decoder

LIB_DEPENDS=	netsnmp:${PORTSDIR}/net-mgmt/net-snmp

USE_OPENSSL=	yes
USE_BISON=	yes

ALL_TARGET=	docsis

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/docsis ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/examples/* ${EXAMPLESDIR}

.include <bsd.port.mk>
