PORTNAME=	MooseX-Traits
PORTVERSION=	0.13
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Moose eXtension to automatically apply roles at object creation time
WWW=		https://metacpan.org/release/MooseX-Traits

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Load>=0:devel/p5-Class-Load \
		p5-Moose>=0:devel/p5-Moose \
		p5-Sub-Exporter>=0:devel/p5-Sub-Exporter \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean
TEST_DEPENDS=	p5-MooseX-Role-Parameterized>=0:devel/p5-MooseX-Role-Parameterized \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Requires>=0:devel/p5-Test-Requires

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes

.include <bsd.port.mk>
