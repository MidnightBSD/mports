# $MidnightBSD$

PORTNAME=	HTTP-Body
PORTVERSION=	1.22
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:GETTY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP Body Parser

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-HTTP-Message>=0:www/p5-HTTP-Message
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-Pod>=1.14:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=1.04:devel/p5-Test-Pod-Coverage

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
