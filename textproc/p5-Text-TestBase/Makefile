PORTNAME=	Text-TestBase
PORTVERSION=	0.13
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser for Test::Base format
WWW=		https://metacpan.org/release/Text-TestBase

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Accessor-Lite>=0.05:devel/p5-Class-Accessor-Lite
TEST_DEPENDS=	p5-Test-Requires>0:devel/p5-Test-Requires

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
