# New ports collection makefile for:   libspf2
# Date created:        May 17 2008
# Whom:                Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/mail/libspf2/Makefile,v 1.5 2012/01/01 17:09:59 laffer1 Exp $
#

PORTNAME=	libspf2
PORTVERSION=	1.2.9
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITES=	http://www.libspf2.org/spf/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Rewriting Scheme 2 C Implementation
LICENSE=	bsd2
# dual license

CONFLICTS=	${PORTNAME}-1.0.* p5-Mail-SPF-[0-9]* p5-Mail-SPF-Query-[0-9]*

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|-pthread|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/__VA_ARGS__/ s|format, ||g' ${WRKSRC}/src/include/spf_log.h

.include <bsd.port.mk>
