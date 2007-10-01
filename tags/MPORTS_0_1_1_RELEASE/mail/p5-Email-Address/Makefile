# New ports collection makefile for:	p5-Email-Address
# Date created:				2004-08-29
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Email-Address/Makefile,v 1.12 2007/03/02 01:26:19 clsung Exp $
#

PORTNAME=	Email-Address
PORTVERSION=	1.88.6
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Email
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.([0-9])$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 2822 Address Parsing and Creation

PERL_CONFIGURE=	yes

MAN3=		Email::Address.3

.include <bsd.port.mk>
