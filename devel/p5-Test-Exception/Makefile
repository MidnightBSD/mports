# $MidnightBSD$

PORTNAME=	Test-Exception
PORTVERSION=	0.31
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test::Exception - test functions for exception based code
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/Builder/Tester.pm:${PORTSDIR}/devel/p5-Test-Simple \
		p5-Sub-Uplevel>=0.18:${PORTSDIR}/devel/p5-Sub-Uplevel
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
