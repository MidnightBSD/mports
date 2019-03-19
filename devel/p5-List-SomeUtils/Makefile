PORTNAME=	List-SomeUtils
PORTVERSION=	0.56
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide the stuff missing in List::Util

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-List-SomeUtils-XS>=0:devel/p5-List-SomeUtils-XS \
		p5-Module-Implementation>=0:devel/p5-Module-Implementation

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
