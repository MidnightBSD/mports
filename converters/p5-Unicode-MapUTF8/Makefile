PORTNAME=	Unicode-MapUTF8
PORTVERSION=	1.14
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class that implements conversion between arbitrary charsets
WWW=		https://metacpan.org/release/Unicode-MapUTF8

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Jcode>=0:converters/p5-Jcode \
		p5-Unicode-Map>=0:converters/p5-Unicode-Map \
		p5-Unicode-Map8>=0:converters/p5-Unicode-Map8 \
		p5-Unicode-String>=0:converters/p5-Unicode-String

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
