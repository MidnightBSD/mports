PORTNAME=	HTML-Scrubber
PORTVERSION=	0.19
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for scrubbing/sanitizing html
WWW=		https://metacpan.org/release/HTML-Scrubber

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Parser>=3.47:www/p5-HTML-Parser
TEST_DEPENDS=	p5-Test-Differences>=0:devel/p5-Test-Differences \
		p5-Test-Memory-Cycle>=0:devel/p5-Test-Memory-Cycle

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
