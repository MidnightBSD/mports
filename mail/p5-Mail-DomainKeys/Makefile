PORTNAME=	Mail-DomainKeys
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl implementation of DomainKeys

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-Crypt-OpenSSL-RSA>=0:security/p5-Crypt-OpenSSL-RSA \
		p5-Mail-Tools>=0:mail/p5-Mail-Tools
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -i '' '6,38d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
