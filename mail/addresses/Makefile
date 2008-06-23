# New ports collection makefile for:    Addresses
# Date created:         13 Nov 2004
# Whom:                 Miguel Mendez <flynn@energyhq.es.eu.org>
#
# $FreeBSD: ports/mail/addresses/Makefile,v 1.4 2006/09/05 06:07:54 dinoex Exp $
# $MidnightBSD: mports/mail/addresses/Makefile,v 1.4 2007/11/07 20:20:14 ctriv Exp $
#

PORTNAME=	addresses
PORTVERSION=	0.4.7
PORTREVISION=	1
CATEGORIES=	mail gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
DISTNAME=	Addresses-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A versatile addressbook for GNUstep
LICENSE=	lgpl

GNUSTEP_PREFIX?=	${LOCALBASE}/GNUstep
PREFIX=		${GNUSTEP_PREFIX}
NO_MTREE=	yes
WRKSRC=		${WRKDIR}/Addresses
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile

.include <bsd.port.mk>
