PORTNAME=	DateTime-TimeZone
DISTVERSION=	2.63
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time zone object base class and factory
WWW=		https://metacpan.org/release/DateTime-TimeZone

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Singleton>=1.03:devel/p5-Class-Singleton \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean \
		p5-Params-ValidationCompiler>=0.13:devel/p5-Params-ValidationCompiler \
		p5-Specio>=0:devel/p5-Specio \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
