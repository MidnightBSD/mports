# New ports collection makefile for:    GNUMail
# Date created:         11 Jun 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/mail/gnumail/Makefile,v 1.4 2007/11/14 20:32:18 laffer1 Exp $
# $FreeBSD: ports/mail/gnumail/Makefile,v 1.30 2006/09/10 20:08:45 dinoex Exp $
#

PORTNAME=	gnumail
PORTVERSION=	1.2.0
CATEGORIES=	mail gnustep
MASTER_SITES=	http://www.collaboration-world.com/gnumail.data/releases/Stable/
DISTNAME=	GNUMail-${PORTVERSION}pre3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep mail client
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/GNUMail
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
	for file in ${WRKSRC}/Bundles/*/GNUmakefile; do \
		${REINPLACE_CMD} -e 's|\$$(GNUSTEP_INSTALLATION_DIR)/Library|\$$(GNUSTEP_LOCAL_LIBRARIES)|' $$file; \
	done
	

.include <bsd.port.mk>
