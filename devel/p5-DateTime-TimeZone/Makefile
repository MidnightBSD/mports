PORTNAME=	DateTime-TimeZone
PORTVERSION=	2.37
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time zone object base class and factory

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Class-Singleton>=1.03:devel/p5-Class-Singleton \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Params-ValidationCompiler>=0.13:devel/p5-Params-ValidationCompiler \
		p5-Specio>=0:devel/p5-Specio \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean
RUN_DEPENDS:=	${BUILD_DEPENDS}

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
