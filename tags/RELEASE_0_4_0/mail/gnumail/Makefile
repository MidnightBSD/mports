# $MidnightBSD: mports/mail/gnumail/Makefile,v 1.9 2011/09/10 21:20:19 laffer1 Exp $

PORTNAME=	gnumail
PORTVERSION=	1.2.0
PORTREVISION=	3
CATEGORIES=	mail gnustep
MASTER_SITES=	http://www.collaboration-world.com/gnumail.data/releases/Stable/
DISTNAME=	GNUMail-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep mail client
LICENSE=	gpl2

#WRKSRC=		${WRKDIR}/GNUMail
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Pantomime:${PANTOMIME_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	Addresses:${ADDRESSES_PORT}
PANTOMIME_PORT?=	mail/pantomime
ADDRESSES_PORT?=	mail/addresses
MAKEFILE=
ALL_TARGET=

post-patch:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_LOCAL_LIBRARIES}/GNUMail/Viewing.prefs

.include <bsd.port.mk>
