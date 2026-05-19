# Created by: Sergey Skvortsov <skv@protey.ru>

PORTNAME=	Test-Unit
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PerlUnit testing framework
WWW=		https://metacpan.org/release/Test-Unit

LICENSE=	artistic gpl2
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Inner>=0:devel/p5-Class-Inner \
		p5-Devel-Symdump>=0:devel/p5-Devel-Symdump \
		p5-Error>=0:lang/p5-Error

USES=		perl5 shebangfix
SHEBANG_FILES=	TestLister.pl
USE_PERL5=	configure
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
