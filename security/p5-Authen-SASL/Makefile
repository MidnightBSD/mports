PORTNAME=	Authen-SASL
PORTVERSION=	2.2100
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:EHUELS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for SASL authentication
WWW=		https://metacpan.org/release/Authen-SASL

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Crypt-URandom>0:security/p5-Crypt-URandom \
		p5-Digest-HMAC>0:security/p5-Digest-HMAC

TEST_DEPENDS=	p5-Pod-Coverage-TrustPod>=0:devel/p5-Pod-Coverage-TrustPod \
		p5-Test-Pod-Coverage>=0:devel/p5-Test-Pod-Coverage \
		p5-Test-Pod>=0:devel/p5-Test-Pod

OPTIONS_DEFINE=	KERBEROS
OPTIONS_DEFAULT=KERBEROS

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ENV+=	AUTOMATED_TESTING=yes

KERBEROS_BUILD_DEPENDS=	p5-GSSAPI>0:security/p5-GSSAPI
KERBEROS_RUN_DEPENDS=	p5-GSSAPI>0:security/p5-GSSAPI

.include <bsd.port.mk>
