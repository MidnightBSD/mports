PORTNAME=	Pod-Coverage-TrustPod
PORTVERSION=	0.100005
CATEGORIES=	devel textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RJBS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Declare trusted symbol names in POD

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Pod-Coverage>=0:devel/p5-Pod-Coverage \
		p5-Pod-Eventual>=0:textproc/p5-Pod-Eventual
# magus issues
#TEST_DEPENDS=	p5-Test-Pod>=1.41:devel/p5-Test-Pod

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
