PORTNAME=	Crypt-DES
PORTVERSION=	2.07
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to DES block cipher
WWW=		https://metacpan.org/release/Crypt-DES

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

BUILD_DEPENDS=	p5-Crypt-CBC>=0:security/p5-Crypt-CBC
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
