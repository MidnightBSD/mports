# $MidnightBSD$

PORTNAME=	Crypt-OpenSSL-Bignum
PORTVERSION=	0.09
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSSL's multiprecision integer arithmetic

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5 ssl
MAKE_ARGS+=	PASTHRU_INC=-I${OPENSSLINC}
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
