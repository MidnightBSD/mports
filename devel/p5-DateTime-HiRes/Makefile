PORTNAME=	DateTime-HiRes
PORTVERSION=	0.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create DateTime objects with sub-second current time resolution
WWW=		https://metacpan.org/release/DateTime-HiRes

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:devel/p5-DateTime

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
