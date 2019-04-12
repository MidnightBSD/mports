PORTNAME=	HTTP-Server-Simple-PSGI
PORTVERSION=	0.16
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PSGI handler for HTTP::Server::Simple

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTTP-Server-Simple>=0.42:www/p5-HTTP-Server-Simple

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

post-patch:
# Remove bundle Plack::Handler::HTTP::Server::Simple
	@${RM} -r ${WRKSRC}/lib/Plack/

.include <bsd.port.mk>
