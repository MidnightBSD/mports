PORTNAME=	LWP-UserAgent-POE
PORTVERSION=	0.05
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Drop-in LWP::UserAgent replacement in POE environments
WWW=		https://metacpan.org/release/LWP-UserAgent-POE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=0.9999:devel/p5-POE \
		p5-POE-Component-Client-HTTP>=0.83:www/p5-POE-Component-Client-HTTP \
		p5-POE-Component-SSLify>=1.008:security/p5-POE-Component-SSLify \
		p5-libwww>=0:www/p5-libwww \
		p5-Log-Log4perl>=1:devel/p5-Log-Log4perl

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
