PORTNAME=	Class-Load
PORTVERSION=	0.25
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Working (require Class::Name) and more

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-OptList>=0.110:devel/p5-Data-OptList \
		p5-Module-Implementation>=0.04:devel/p5-Module-Implementation \
		p5-Module-Runtime>=0.012:devel/p5-Module-Runtime \
		p5-Package-Stash>=0.14:devel/p5-Package-Stash \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Needs>=0:devel/p5-Test-Needs \
		p5-Test-Without-Module>=0:devel/p5-Test-Without-Module

CONFIGURE_ENV=	PERL_MM_FALLBACK_SILENCE_WARNING=omg # hide warn about bad toolchain

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
