PORTNAME=	Software-License-CCpack
PORTVERSION=	1.11
CATEGORIES=	misc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BBYRD
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Software::License pack for Creative Commons licenses

LICENSE=	lgpl3

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Software-License>=0:misc/p5-Software-License
TEST_DEPENDS=	p5-Test-CheckDeps>=0.010:devel/p5-Test-CheckDeps

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
