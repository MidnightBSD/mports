# $MidnightBSD$

PORTNAME=	Throwable
PORTVERSION=	0.200013
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RJBS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy-to-use class for error objects

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Devel-StackTrace>=1.32:devel/p5-Devel-StackTrace \
		p5-Module-Runtime>=0.002:devel/p5-Module-Runtime \
		p5-Moo>=1.000001:devel/p5-Moo

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
