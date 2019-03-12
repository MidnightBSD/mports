# $MidnightBSD$

PORTNAME=	Crypt-OpenSSL-RSA
PORTVERSION=	0.30
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to RSA encode and decode strings using OpenSSL

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Random.pm:security/p5-Crypt-OpenSSL-Random \
		p5-Crypt-OpenSSL-Guess>=0.11:security/p5-Crypt-OpenSSL-Guess \
		${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Bignum.pm:security/p5-Crypt-OpenSSL-Bignum
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
