PORTNAME=	POE-Filter-DNS-TCP
PORTVERSION=	0.06
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POE Filter to handle DNS over TCP connections
WWW=		https://metacpan.org/release/POE-Filter-DNS-TCP

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Net-DNS>=0.66:dns/p5-Net-DNS \
		p5-POE>=1.311:devel/p5-POE

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
