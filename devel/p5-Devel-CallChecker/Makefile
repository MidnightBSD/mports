PORTNAME=	Devel-CallChecker
PORTVERSION=	0.009
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Custom op checking attached to subroutines
WWW=		https://metacpan.org/release/Devel-CallChecker

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DynaLoader-Functions>=0.001:devel/p5-DynaLoader-Functions
TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=0:devel/p5-Test-Pod-Coverage

USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
