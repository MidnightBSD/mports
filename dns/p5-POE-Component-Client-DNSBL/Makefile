PORTNAME=	POE-Component-Client-DNSBL
PORTVERSION=	1.08
PORTREVISION=	1
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl POE component that provides non-blocking DNSBL lookups
WWW=		https://metacpan.org/release/POE-Component-Client-DNSBL

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=1.004:devel/p5-POE \
		p5-Net-IP-Minimal>=0:net/p5-Net-IP-Minimal \
		p5-POE-Component-Client-DNS>=0:dns/p5-POE-Component-Client-DNS

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
