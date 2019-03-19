PORTNAME=	MooX-StrictConstructor
PORTVERSION=	0.010
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make your Moo-based object constructors blow up on unknown attributes

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Method-Modifiers>=0:devel/p5-Class-Method-Modifiers \
		p5-Moo>=1.001000:devel/p5-Moo \
		p5-strictures>=1:devel/p5-strictures
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
