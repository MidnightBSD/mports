# New ports collection makefile for:    preferencepanes
# Date created:         29 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/deskutils/preferencepanes/Makefile,v 1.1 2006/10/31 06:17:17 dinoex Exp $
# $MidnightBSD: mports/deskutils/preferencepanes/Makefile,v 1.3 2007/11/07 20:20:11 ctriv Exp $
#

PORTNAME=	preferencepanes
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://www.gnustep.it/enrico/system-preferences/
DISTNAME=	systempreferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PreferencePanes framework for GNUstep
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${DISTNAME}/PreferencePanes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	1.0.0

.include <bsd.port.mk>
