PORTNAME=	LWP-Protocol-https
PORTVERSION=	6.14
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide https support for LWP::UserAgent
WWW=		https://metacpan.org/release/LWP-Protocol-https

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-IO-Socket-SSL>=1.970:security/p5-IO-Socket-SSL \
		p5-Net-HTTP>=6:net/p5-Net-HTTP \
		p5-libwww>=6.06:www/p5-libwww
TEST_DEPENDS=	p5-Test-Needs>=0.002010:devel/p5-Test-Needs \
		p5-Test-RequiresInternet>=0:devel/p5-Test-RequiresInternet

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5

NO_TEST=	yes

.include <bsd.port.mk>
