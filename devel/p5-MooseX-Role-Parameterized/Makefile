PORTNAME=	MooseX-Role-Parameterized
PORTVERSION=	1.10
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Roles with composition parameters

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Moose>=2.0300:devel/p5-Moose \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean \
		p5-namespace-clean>=0.19:devel/p5-namespace-clean

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	modbuildtiny

NO_TEST=	yes

.include <bsd.port.mk>
