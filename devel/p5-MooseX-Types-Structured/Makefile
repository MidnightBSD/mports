PORTNAME=	MooseX-Types-Structured
PORTVERSION=	0.36
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Moose Type Constraint classes for Structured Types
WWW=		https://metacpan.org/release/MooseX-Types-Structured

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Devel-PartialDump>=0.13:devel/p5-Devel-PartialDump \
		p5-Moose>=1.08:devel/p5-Moose \
		p5-MooseX-Types>=0.22:devel/p5-MooseX-Types \
		p5-Sub-Exporter>=0.982:devel/p5-Sub-Exporter \
		p5-namespace-clean>=0.19:devel/p5-namespace-clean
TEST_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Needs>=0:devel/p5-Test-Needs

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes

.include <bsd.port.mk>
