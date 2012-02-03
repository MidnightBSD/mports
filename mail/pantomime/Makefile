# $MidnightBSD: mports/mail/pantomime/Makefile,v 1.5 2009/04/16 04:03:57 laffer1 Exp $

PORTNAME=	pantomime
PORTVERSION=	1.2.0
CATEGORIES=	mail gnustep
MASTER_SITES=	http://www.collaboration-world.com/pantomime.data/releases/Stable/ \
		http://download.gna.org/gnustep-nonfsf/
DISTNAME=	Pantomime-${PORTVERSION}pre3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail/MIME handling library for GNUstep
LICENSE=	lgpl2.1

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
