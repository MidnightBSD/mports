PORTNAME=	POE-Component-SSLify
PORTVERSION=	1.012
CATEGORIES=	security perl5
MASTER_SITES=	CPAN/${PORTNAME:C/-.*//}/APOCAL
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrate SSL into POE
WWW=		https://metacpan.org/release/POE-Component-SSLify

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Net-SSLeay>=1.36:security/p5-Net-SSLeay \
		p5-POE>=1.267:devel/p5-POE \
		p5-Task-Weaken>=1.03:devel/p5-Task-Weaken
#TEST_DEPENDS=	p5-Test-FailWarnings>=0:devel/p5-Test-FailWarnings

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes
# test hangs on magus and blocks
NO_TEST=	yes

.include <bsd.port.mk>
