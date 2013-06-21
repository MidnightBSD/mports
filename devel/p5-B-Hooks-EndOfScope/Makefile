# $MidnightBSD$

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

.include <bsd.port.mk>
