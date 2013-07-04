# $MidnightBSD: mports/mail/p5-Email-Simple/Makefile,v 1.2 2009/04/08 20:59:07 laffer1 Exp $

PORTNAME=	Email-Simple
PORTVERSION=	2.100
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C|\.([0-9])$|\1|}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple parsing of RFC2822 message format and headers
LICENSE=	gpl2

PERL_CONFIGURE=	yes

MAN3=		Email::Simple.3 Email::Simple::Header.3

.include <bsd.port.mk>
