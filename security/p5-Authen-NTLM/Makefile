PORTNAME=	Authen-NTLM
PORTVERSION=	1.09
PORTREVISION=	1
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME:C/.*-//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 NTLM authentication module
WWW=		https://metacpan.org/release/NTLM

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Digest-HMAC>=0:security/p5-Digest-HMAC
RUN_DEPENDS=	p5-Digest-HMAC>=0:security/p5-Digest-HMAC

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
