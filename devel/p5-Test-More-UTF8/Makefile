PORTNAME=	Test-More-UTF8
PORTVERSION=	0.05
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhancing Test::More for UTF-8-based projects
WWW=		https://metacpan.org/release/Test-More-UTF8

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Test-Pod>=1.22:devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=1.08:devel/p5-Test-Pod-Coverage

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
