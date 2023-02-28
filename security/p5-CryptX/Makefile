PORTNAME=	CryptX
PORTVERSION=	0.077
CATEGORIES=	security perl5
MASTER_SITES=	CPAN/Crypt
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Crypto toolkit
WWW=		https://metacpan.org/release/CryptX

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/CryptX/CryptX.so

.include <bsd.port.mk>
