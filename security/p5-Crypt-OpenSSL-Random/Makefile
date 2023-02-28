PORTNAME=	Crypt-OpenSSL-Random
PORTVERSION=	0.15
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RURBAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the OpenSSL pseudo-random number generator

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_artistic=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Crypt-OpenSSL-Guess>=0.11:security/p5-Crypt-OpenSSL-Guess

MAKE_ARGS=	PASTHRU_INC=-I${OPENSSLINC}
USES=		perl5 ssl
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Crypt/OpenSSL/Random/Random.so

.include <bsd.port.mk>
