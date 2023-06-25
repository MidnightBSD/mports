PORTNAME=	Authen-SASL
PORTVERSION=	2.16
PORTREVISION=	2
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for SASL authentication
WWW=		https://metacpan.org/release/Authen-SASL

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Digest-MD5>0:security/p5-Digest-MD5 \
	p5-Digest-HMAC>0:security/p5-Digest-HMAC

OPTIONS_DEFINE=	KERBEROS
OPTIONS_DEFAULT=KERBEROS

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ENV+=	AUTOMATED_TESTING=yes

KERBEROS_BUILD_DEPENDS=	p5-GSSAPI>0:security/p5-GSSAPI
KERBEROS_RUN_DEPENDS=	p5-GSSAPI>0:security/p5-GSSAPI

.include <bsd.port.mk>
