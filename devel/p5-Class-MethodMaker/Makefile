PORTNAME=	Class-MethodMaker
PORTVERSION=	2.24
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for creating generic methods

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Class/MethodMaker/MethodMaker.so

.include <bsd.port.mk>
