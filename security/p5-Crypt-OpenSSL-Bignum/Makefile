PORTNAME=	Crypt-OpenSSL-Bignum
PORTVERSION=	0.09
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSSL's multiprecision integer arithmetic
WWW=		https://metacpan.org/release/Crypt-OpenSSL-Bignum

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5 ssl
MAKE_ARGS+=	PASTHRU_INC=-I${OPENSSLINC}
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Crypt/OpenSSL/Bignum/Bignum.so

.include <bsd.port.mk>
