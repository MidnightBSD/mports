# New ports collection makefile for:    textedit.app
# Date created:         28 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/editors/textedit.app/Makefile,v 1.1 2006/09/25 03:00:19 laffer1 Exp $ 
# $FreeBSD: ports/editors/textedit.app/Makefile,v 1.1 2006/09/06 17:12:46 ehaupt Exp $
#

PORTNAME=	textedit.app
PORTVERSION=	4.0
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic text editor for GNUstep

WRKSRC=		${WRKDIR}/textedit-${PORTVERSION}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile

.include <bsd.port.pre.mk>

.include <bsd.port.post.mk>
