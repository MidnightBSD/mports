PORTNAME=	Data-OptList
PORTVERSION=	0.114
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and validate simple name/value option pairs
WWW=		https://metacpan.org/release/Data-OptList

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Params-Util>=0.14:devel/p5-Params-Util \
		p5-Sub-Install>=0.92:devel/p5-Sub-Install

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
