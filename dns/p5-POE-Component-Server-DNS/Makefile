PORTNAME=	POE-Component-Server-DNS
PORTVERSION=	0.32
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-blocking, concurrent DNS server component
WWW=		https://metacpan.org/release/POE-Component-Server-DNS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Net-DNS>=0.58:dns/p5-Net-DNS \
		p5-POE>=0.38:devel/p5-POE \
		p5-POE-Component-Client-DNS>=1.051:dns/p5-POE-Component-Client-DNS \
		p5-POE-Component-Client-DNS-Recursive>=1.04:dns/p5-POE-Component-Client-DNS-Recursive \
		p5-POE-Component-Generic>=0.0910:net/p5-POE-Component-Generic \
		p5-POE-Filter-DNS-TCP>=0.04:dns/p5-POE-Filter-DNS-TCP

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
