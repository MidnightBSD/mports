PORTNAME=	Package-Stash
PORTVERSION=	0.38
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines for manipulating stashes

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Dist-CheckConflicts>=0.02:devel/p5-Dist-CheckConflicts \
		p5-Module-Implementation>=0.06:devel/p5-Module-Implementation \
		p5-Package-Stash-XS>=0.22:devel/p5-Package-Stash-XS
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Requires>=0:devel/p5-Test-Requires

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
