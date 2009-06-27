# $MidnightBSD: mports/net/p5-Net-XWhois/Makefile,v 1.1 2007/06/11 01:41:59 laffer1 Exp $

PORTNAME=	Net-XWhois
PORTVERSION=	0.90
PORTREVISION=	4
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Whois Client Interface for Perl5
LICENSE=	perl

PERL_CONFIGURE=	YES

MAN3=		Net::XWhois.3

post-patch:
	@${FIND} ${WRKSRC} -type f -name "*.orig" -delete

.include <bsd.port.mk>
