

PORTNAME=	Unicode-MapUTF8
PORTVERSION=	1.11
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class that implements conversion between arbitrary charsets

LICENSE=      artistic gpl
LICENSE_COMB= dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Jcode>=0:converters/p5-Jcode \
		p5-Unicode-Map>=0:converters/p5-Unicode-Map \
		p5-Unicode-Map8>=0:converters/p5-Unicode-Map8 \
		p5-Unicode-String>=0:converters/p5-Unicode-String

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
