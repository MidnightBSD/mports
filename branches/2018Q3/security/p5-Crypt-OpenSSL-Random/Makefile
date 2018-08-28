# $MidnightBSD$

PORTNAME=	Crypt-OpenSSL-Random
PORTVERSION=	0.15
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the OpenSSL pseudo-random number generator

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE_ART10=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Crypt-OpenSSL-Guess>=0.11:security/p5-Crypt-OpenSSL-Guess

MAKE_ARGS=	PASTHRU_INC=-I${OPENSSLINC}
USES=		perl5 ssl
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
