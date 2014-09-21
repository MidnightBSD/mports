# $MidnightBSD$

PORTNAME=	Math-Random-ISAAC
PORTVERSION=	1.004
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JAWNSY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to the ISAAC PRNG Algorithm

LICENSE=	artistic gpl mit publicdom
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Test-NoWarnings>0:${PORTSDIR}/devel/p5-Test-NoWarnings
RUN_DEPENDS:=	${BUILD_DEPENDS} \
		p5-Math-Random-ISAAC-XS>0:${PORTSDIR}/math/p5-Math-Random-ISAAC-XS

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
