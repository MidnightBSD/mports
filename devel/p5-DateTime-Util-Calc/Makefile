PORTNAME=	DateTime-Util-Calc
PORTVERSION=	0.13002
PORTREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DateTime Calculation Utilities
WWW=		https://metacpan.org/release/DateTime-Util-Calc

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	GMP

GMP_BUILD_DEPENDS=	p5-Math-BigInt-GMP>=0:math/p5-Math-BigInt-GMP
GMP_RUN_DEPENDS=	p5-Math-BigInt-GMP>=0:math/p5-Math-BigInt-GMP

.include <bsd.port.mk>
