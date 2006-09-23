# New ports collection makefile for:    terminal.app
# Date created:         28 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD$
# $FreeBSD: ports/x11/terminal.app/Makefile,v 1.1 2006/09/06 19:22:27 ehaupt Exp $
#

PORTNAME=	terminal.app
PORTVERSION=	0.9.4
DISTVERSIONSUFFIX=	+cvs20051125.orig
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal Emulator for GNUstep

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

MAKEFILE=	GNUmakefile

WRKSRC=		${WRKDIR}/${PORTNAME:C/\.app//}-${DISTVERSION}${DISTVERSIONSUFFIX:C/\.orig//}

.include <bsd.port.pre.mk>

.include <bsd.port.post.mk>
