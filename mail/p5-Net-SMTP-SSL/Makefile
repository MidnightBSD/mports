PORTNAME=	Net-SMTP-SSL
PORTVERSION=	1.04
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An SMTP client supporting SSL

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/IO/Socket/SSL.pm:security/p5-IO-Socket-SSL

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
