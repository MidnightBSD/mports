PORTNAME=	MooseX-POE
PORTVERSION=	0.215
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Illicit Love Child of Moose and POE
WWW=		https://metacpan.org/release/MooseX-POE

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Moose>=2.0002:devel/p5-Moose \
		p5-POE>=1.310:devel/p5-POE
TEST_DEPENDS=	p5-MooseX-Declare>=0:devel/p5-MooseX-Declare \
		p5-Test-Fatal>=0.003:devel/p5-Test-Fatal

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
