PORTNAME=	Archive-Any-Lite
PORTVERSION=	0.11
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple CPAN package extractor
WWW=		https://metacpan.org/release/Archive-Any-Lite

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-MakeMaker-CPANfile>=0.07:devel/p5-ExtUtils-MakeMaker-CPANfile \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-Archive-Zip>=0:archivers/p5-Archive-Zip
TEST_DEPENDS=	p5-Parallel-ForkManager>=0:devel/p5-Parallel-ForkManager \
		p5-Test-Pod>=1.18:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=1.04:devel/p5-Test-Pod-Coverage \
		p5-Test-UseAllModules>=0.10:devel/p5-Test-UseAllModules

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
