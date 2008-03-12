# New ports collection makefile for:    freetar
# Date created:         3 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: /repoman/r/pcvs/ports/archivers/freetar/Makefile,v 1.1 2006/12/03 16:18:44 dinoex Exp $
# $MidnightBSD: mports/archivers/freetar/Makefile,v 1.3 2007/11/07 20:20:09 ctriv Exp $
#

PORTNAME=	freetar
PORTVERSION=	0.9
PORTREVISION=	1
CATEGORIES=	archivers gnustep
MASTER_SITES=	http://download.gna.org/freetar/
DISTNAME=	FreeTar-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TAR archiver for GNUstep
LICENSE=	gpl2

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

MAKEFILE=	GNUmakefile

WRKSRC=		${WRKDIR}/FreeTar_1_1_1_Source

.include <bsd.port.mk>
