

PORTNAME=	MooX-Types-MooseLike
PORTVERSION=	0.29
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Some Moosish types and a typer builder

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Module-Runtime>=0.014:devel/p5-Module-Runtime
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Moo>=1.004002:devel/p5-Moo \
		p5-Set-Object>=1:devel/p5-Set-Object \
		p5-Test-Fatal>=0.003:devel/p5-Test-Fatal

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
