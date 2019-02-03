# $MidnightBSD$

PORTNAME=	Package-Stash
PORTVERSION=	0.36
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DOY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines for manipulating stashes

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Dist-CheckConflicts>=0.02:${PORTSDIR}/devel/p5-Dist-CheckConflicts \
		p5-Module-Implementation>=0.06:${PORTSDIR}/devel/p5-Module-Implementation \
		p5-Package-Stash-XS>=0.22:${PORTSDIR}/devel/p5-Package-Stash-XS
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
