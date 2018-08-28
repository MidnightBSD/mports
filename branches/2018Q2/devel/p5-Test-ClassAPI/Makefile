# $MidnightBSD$

PORTNAME=	Test-ClassAPI
PORTVERSION=	1.06
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides basic first-pass API testing for large class trees
LICENSE=	perl

RUN_DEPENDS=	p5-Class-Inspector>=1.12:${PORTSDIR}/devel/p5-Class-Inspector \
		p5-Config-Tiny>=2.00:${PORTSDIR}/devel/p5-Config-Tiny \
		p5-Params-Util>=1.00:${PORTSDIR}/devel/p5-Params-Util
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
