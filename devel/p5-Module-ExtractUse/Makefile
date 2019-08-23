PORTNAME=	Module-ExtractUse
PORTVERSION=	0.343
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find out what CPAN modules are used

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Parse-RecDescent>=1.967:devel/p5-Parse-RecDescent \
		p5-Pod-Strip>=0:textproc/p5-Pod-Strip
TEST_DEPENDS=	p5-UNIVERSAL-require>=0.11:devel/p5-UNIVERSAL-require \
		p5-Test-Deep>0:devel/p5-Test-Deep

USES=		perl5
USE_PERL5=	modbuild

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
