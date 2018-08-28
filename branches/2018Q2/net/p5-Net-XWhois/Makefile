# $MidnightBSD$

PORTNAME=	Net-XWhois
PORTVERSION=	0.90
PORTREVISION=	5
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Whois Client Interface for Perl5

LICENSE=	artistic gpl
LICENSE_COMB=	dual

PERL_CONFIGURE=	YES

post-patch:
	@${FIND} ${WRKSRC} -type f -name "*.orig" -delete

.include <bsd.port.mk>
