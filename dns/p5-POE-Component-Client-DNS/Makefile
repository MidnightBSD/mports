PORTNAME=	POE-Component-Client-DNS
PORTVERSION=	1.054
PORTEPOCH=	1
CATEGORIES=	dns perl5 devel
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POE component for non-blocking/concurrent DNS queries
WWW=		https://metacpan.org/release/POE-Component-Client-DNS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Net-DNS>=0.65:dns/p5-Net-DNS \
		p5-POE>=1.249:devel/p5-POE
TEST_DEPENDS=	p5-Test-NoWarnings>=1.02:devel/p5-Test-NoWarnings

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
