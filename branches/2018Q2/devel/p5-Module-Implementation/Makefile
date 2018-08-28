# $MidnightBSD$

PORTNAME=	Module-Implementation
PORTVERSION=	0.06
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Loads one of several alternate underlying implementations for a module
LICENSE=	perl

BUILD_DEPENDS=	p5-Module-Runtime>=0.012:${PORTSDIR}/devel/p5-Module-Runtime \
		p5-Try-Tiny>=0:${PORTSDIR}/lang/p5-Try-Tiny
RUN_DEPENDS=	p5-Module-Runtime>=0.012:${PORTSDIR}/devel/p5-Module-Runtime \
		p5-Try-Tiny>=0:${PORTSDIR}/lang/p5-Try-Tiny

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
