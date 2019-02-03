# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Class-Load/Makefile,v 1.2 2010/12/19 13:31:27 az Exp $

PORTNAME=	Class-Load
PORTVERSION=	0.24
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Working (require Class::Name) and more

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Data-OptList>0:${PORTSDIR}/devel/p5-Data-OptList \
		p5-Module-Implementation>=0.04:${PORTSDIR}/devel/p5-Module-Implementation \
		p5-Module-Runtime>=0.012:${PORTSDIR}/devel/p5-Module-Runtime \
		p5-Package-Stash>=0.14:${PORTSDIR}/devel/p5-Package-Stash \
		p5-Try-Tiny>=0:${PORTSDIR}/lang/p5-Try-Tiny \
		p5-namespace-clean>=0:${PORTSDIR}/devel/p5-namespace-clean
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires \
		p5-Test-Without-Module>=0:${PORTSDIR}/devel/p5-Test-Without-Module

CONFIGURE_ENV=	PERL_MM_FALLBACK_SILENCE_WARNING=omg # hide warn about bad toolchain

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
