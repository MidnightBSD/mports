PORTNAME=	POE-Component-Server-SimpleHTTP
PORTVERSION=	2.30
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to serve HTTP requests in POE
WWW=		https://metacpan.org/release/POE-Component-Server-SimpleHTTP

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Moose>=0.9:devel/p5-Moose \
		p5-MooseX-POE>=0.205:devel/p5-MooseX-POE \
		p5-POE>=1:devel/p5-POE
TEST_DEPENDS=	p5-POE-Component-Client-HTTP>=0.82:www/p5-POE-Component-Client-HTTP \
		p5-POE-Filter-HTTP-Parser>=1.06:www/p5-POE-Filter-HTTP-Parser \
		p5-Test-POE-Client-TCP>=1.24:devel/p5-Test-POE-Client-TCP

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

OPTIONS_DEFINE=	SSL
OPTIONS_DEFAULT=SSL

SSL_DESC=		SSL support (POE::Component::SSLify)
SSL_BUILD_DEPENDS=	p5-POE-Component-SSLify>=0.04:security/p5-POE-Component-SSLify
SSL_RUN_DEPENDS=	${SSL_BUILD_DEPENDS}

.include <bsd.port.mk>
