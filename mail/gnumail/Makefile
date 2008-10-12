# New ports collection makefile for:    GNUMail
# Date created:         11 Jun 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/mail/gnumail/Makefile,v 1.7 2008/10/12 14:32:36 laffer1 Exp $
# $FreeBSD: ports/mail/gnumail/Makefile,v 1.30 2006/09/10 20:08:45 dinoex Exp $
#

PORTNAME=	gnumail
PORTVERSION=	1.2.0
PORTREVISION=	2
CATEGORIES=	mail gnustep
MASTER_SITES=	http://www.collaboration-world.com/gnumail.data/releases/Stable/
DISTNAME=	GNUMail-${PORTVERSION}pre3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep mail client
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/GNUMail
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Pantomime:${PANTOMIME_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	Addresses:${ADDRESSES_PORT}
MAKEFILE=
ALL_TARGET=
PANTOMIME_PORT?=	mail/pantomime
ADDRESSES_PORT?=	mail/addresses

post-patch:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_LOCAL_LIBRARIES}/GNUMail/Viewing.prefs

.include <bsd.port.mk>
