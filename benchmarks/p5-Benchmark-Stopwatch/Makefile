PORTNAME=	Benchmark-Stopwatch
PORTVERSION=	0.05
CATEGORIES=	benchmarks perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple timing of stages of your code
WWW=		https://metacpan.org/release/Benchmark-Stopwatch

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS} \
		p5-Test-LongString>=0:devel/p5-Test-LongString
RUN_DEPENDS=	p5-Clone>=0:devel/p5-Clone

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
