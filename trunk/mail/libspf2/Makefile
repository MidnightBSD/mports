# New ports collection makefile for:   libspf2
# Date created:        May 17 2008
# Whom:                Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/mail/libspf2/Makefile,v 1.4 2011/02/02 21:07:58 laffer1 Exp $
#

PORTNAME=	libspf2
PORTVERSION=	1.2.9
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.libspf2.org/%SUBDIR%/
MASTER_SITE_SUBDIR=	spf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Rewriting Scheme 2 C Implementation
LICENSE=	bsd2
# dual license

CONFLICTS=	${PORTNAME}-1.0.*

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e "s|-lpthread|${PTHREAD_LIBS}|g" \
		${WRKSRC}/configure

.include <bsd.port.mk>
