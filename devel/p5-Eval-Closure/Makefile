PORTNAME=	Eval-Closure
PORTVERSION=	0.14
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DOY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Safely and cleanly create closures via string eval
WWW=		https://metacpan.org/release/Eval-Closure

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Try-Tiny>=0:lang/p5-Try-Tiny
TEST_DEPENDS=	p5-Devel-LexAlias>=0.05:devel/p5-Devel-LexAlias \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Requires>=0:devel/p5-Test-Requires

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
