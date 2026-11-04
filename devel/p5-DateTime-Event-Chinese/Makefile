PORTNAME=	DateTime-Event-Chinese
PORTVERSION=	1.00
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DMAKI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DateTime Extension for Calculating Important Chinese Dates
WWW=		https://metacpan.org/release/DateTime-Event-Chinese

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-DateTime-Astro>=0:devel/p5-DateTime-Astro \
		p5-Math-Round>=0:math/p5-Math-Round
RUN_DEPENDS=	p5-DateTime-Astro>=0:devel/p5-DateTime-Astro \
		p5-Math-Round>=0:math/p5-Math-Round

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
