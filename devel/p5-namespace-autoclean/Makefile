# Created by: Sergey Skvortsov <skv@protey.ru>
# $FreeBSD: head/devel/p5-namespace-autoclean/Makefile 449893 2017-09-15 08:58:46Z mat $
# $MidnightBSD$

PORTNAME=	namespace-autoclean
PORTVERSION=	0.28
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keep imports out of your namespace

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Hooks-EndOfScope>=0.12:devel/p5-B-Hooks-EndOfScope \
		p5-Sub-Identify>=0:devel/p5-Sub-Identify \
		p5-namespace-clean>=0.20:devel/p5-namespace-clean
TEST_DEPENDS=	p5-Moo>=0:devel/p5-Moo \
		p5-Moose>=2:devel/p5-Moose \
		p5-Mouse>=0:devel/p5-Mouse \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Requires>=0:devel/p5-Test-Requires \
		p5-Test-Spelling>0.12:devel/p5-Test-Spelling

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
