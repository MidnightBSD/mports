PORTNAME=	Crypt-PBKDF2
PORTVERSION=	0.161520
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PBKDF2 password hashing algorithm
WWW=		https://metacpan.org/release/Crypt-PBKDF2

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Digest-HMAC>=1.01:security/p5-Digest-HMAC \
		p5-Digest-SHA3>=0.22:security/p5-Digest-SHA3 \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Moo>=2:devel/p5-Moo \
		p5-Try-Tiny>=0.04:lang/p5-Try-Tiny \
		p5-Type-Tiny>=0:devel/p5-Type-Tiny \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean \
		p5-strictures>=2:devel/p5-strictures
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
