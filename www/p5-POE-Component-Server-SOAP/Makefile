PORTNAME=	POE-Component-Server-SOAP
PORTVERSION=	1.14
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Publish POE event handlers via SOAP over HTTP
WWW=		https://metacpan.org/release/POE-Component-Server-SOAP

LICENSE=	NONE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-SOAP-Lite>=0.55:net/p5-SOAP-Lite \
		p5-POE-Component-Server-SimpleHTTP>=1.54:www/p5-POE-Component-Server-SimpleHTTP \
		p5-POE>=0:devel/p5-POE

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
