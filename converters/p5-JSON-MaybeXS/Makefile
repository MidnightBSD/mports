PORTNAME=	JSON-MaybeXS
PORTVERSION=	1.004005
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use Cpanel::JSON::XS with a fallback to JSON::PP
WWW=		https://metacpan.org/release/JSON-MaybeXS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cpanel-JSON-XS>=2.3310:converters/p5-Cpanel-JSON-XS
TEST_DEPENDS=	p5-JSON-XS>=0:converters/p5-JSON-XS \
		p5-Test-Needs>=0.002006:devel/p5-Test-Needs \
		p5-Test-Without-Module>=0.17:devel/p5-Test-Without-Module

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
