PORTNAME=	Date-Calc
PORTVERSION=	6.4
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gregorian calendar date calculations
WWW=		https://metacpan.org/pod/Date::Calc

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Bit-Vector>=7.4:math/p5-Bit-Vector \
		p5-Carp-Clan>=6.04:devel/p5-Carp-Clan

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
