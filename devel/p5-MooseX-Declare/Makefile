PORTNAME=	MooseX-Declare
PORTVERSION=	0.43
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Declarative syntax for Moose
WWW=		https://metacpan.org/release/MooseX-Declare

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

DEPRECATED=	Deprecated by upstream without any alternative

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Devel-Declare>=0.005011:devel/p5-Devel-Declare \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Moose>=0.90:devel/p5-Moose \
		p5-MooseX-Method-Signatures>=0.36:devel/p5-MooseX-Method-Signatures \
		p5-MooseX-Role-Parameterized>=0.12:devel/p5-MooseX-Role-Parameterized \
		p5-MooseX-Types>=0.20:devel/p5-MooseX-Types \
		p5-Parse-Method-Signatures>=0:devel/p5-Parse-Method-Signatures \
		p5-Sub-Exporter>=0:devel/p5-Sub-Exporter \
		p5-Sub-Install>=0:devel/p5-Sub-Install \
		p5-aliased>=0:devel/p5-aliased \
		p5-namespace-autoclean>=0.16:devel/p5-namespace-autoclean \
		p5-namespace-clean>=0.19:devel/p5-namespace-clean
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes

.include <bsd.port.mk>
