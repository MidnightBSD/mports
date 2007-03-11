# New ports collection makefile for:    Pantomime
# Date created:         17 Sep 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/pantomime/Makefile,v 1.26 2006/03/19 04:35:46 dinoex Exp $
#

PORTNAME=	pantomime
PORTVERSION=	1.1.2
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.collaboration-world.com/pantomime.data/releases/Stable/
DISTNAME=	Pantomime-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail/MIME handling library for GNUstep

WRKSRC=		${WRKDIR}/Pantomime
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
LDCONFIG_DIRS=	${LOCALLIBDIR}
USE_LDCONFIG=yes

.include <bsd.port.mk>
