PORTNAME=	Module-Runtime-Conflicts
PORTVERSION=	0.003
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide information on conflicts for Module::Runtime

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENCE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Dist-CheckConflicts>=0:devel/p5-Dist-CheckConflicts \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
