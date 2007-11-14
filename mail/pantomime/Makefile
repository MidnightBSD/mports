# New ports collection makefile for:    Pantomime
# Date created:         17 Sep 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/mail/pantomime/Makefile,v 1.3 2007/11/07 20:20:14 ctriv Exp $
# $FreeBSD: ports/mail/pantomime/Makefile,v 1.26 2006/03/19 04:35:46 dinoex Exp $
#

PORTNAME=	pantomime
PORTVERSION=	1.2.0
CATEGORIES=	mail gnustep
MASTER_SITES=	http://www.collaboration-world.com/pantomime.data/releases/Stable/
DISTNAME=	Pantomime-${PORTVERSION}pre3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail/MIME handling library for GNUstep

WRKSRC=		${WRKDIR}/Pantomime
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

DEFAULT_LIBVERSION=	1.2

.include <bsd.port.mk>
