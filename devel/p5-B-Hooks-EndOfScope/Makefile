# $MidnightBSD: mports/devel/p5-B-Hooks-EndOfScope/Makefile,v 1.1 2010/11/11 00:40:31 laffer1 Exp $

PORTNAME=	B-Hooks-EndOfScope
PORTVERSION=	0.12
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Execute code after a scope finished compilation
LICENSE=	perl

BUILD_DEPENDS=	p5-Module-Implementation>=0.05:${PORTSDIR}/devel/p5-Module-Implementation \
		p5-Module-Runtime>=0.012:${PORTSDIR}/devel/p5-Module-Runtime \
		p5-Sub-Exporter-Progressive>=0.001.006:${PORTSDIR}/devel/p5-Sub-Exporter-Progressive
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		B::Hooks::EndOfScope.3 \
		B::Hooks::EndOfScope::PP.3 \
		B::Hooks::EndOfScope::PP::FieldHash.3 \
		B::Hooks::EndOfScope::PP::HintHash.3 \
		B::Hooks::EndOfScope::XS.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
BUILD_DEPENDS+=	p5-ExtUtils-CBuilder>=0.2600:${PORTSDIR}/devel/p5-ExtUtils-CBuilder
TEST_DEPENDS+=	p5-Test-Simple>=0.89:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
