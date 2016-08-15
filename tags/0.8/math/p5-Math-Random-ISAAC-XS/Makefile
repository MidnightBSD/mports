# $MidnightBSD$

PORTNAME=	Math-Random-ISAAC-XS
PORTVERSION=	1.004
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JAWNSY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C implementation of the ISAAC PRNG Algorithm

LICENSE=	artistic gpl mit publicdom
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Test-NoWarnings>0:${PORTSDIR}/devel/p5-Test-NoWarnings
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes

.include <bsd.port.mk>
