PORTNAME=	POE-Component-Server-HTTPServer
PORTVERSION=	0.9.2
PORTREVISION=	1
CATEGORIES=	www devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POE Component to server HTTP requests
WWW=		https://metacpan.org/release/POE-Component-Server-HTTPServer

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=0:devel/p5-POE \
		p5-libwww>=0:www/p5-libwww \
		p5-HTML-Template-HashWrapper>=0:www/p5-HTML-Template-HashWrapper \
		p5-MIME-Types>=0:mail/p5-MIME-Types

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
