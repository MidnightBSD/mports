# $MidnightBSD$

PORTNAME=	B-Hooks-EndOfScope
PORTVERSION=	0.09
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Execute code after a scope finished compilation
LICENSE=	perl

RUN_DEPENDS=	p5-Variable-Magic>=0.31:${PORTSDIR}/devel/p5-Variable-Magic \
		p5-Sub-Exporter>0:${PORTSDIR}/devel/p5-Sub-Exporter
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	5.8.0+

MAN3=	B::Hooks::EndOfScope.3

.include <bsd.port.mk>
