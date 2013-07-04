# $MidnightBSD: mports/devel/p5-Package-Stash/Makefile,v 1.1 2010/10/22 16:38:34 laffer1 Exp $

PORTNAME=	Package-Stash
PORTVERSION=	0.33
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DOY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines for manipulating stashes
LICENSE=	perl

BUILD_DEPENDS=	\
	p5-Dist-CheckConflicts>=0.02:${PORTSDIR}/devel/p5-Dist-CheckConflicts \
	p5-Package-DeprecationManager>=0:${PORTSDIR}/devel/p5-Package-DeprecationManager \
	p5-Package-Stash-XS>=0.22:${PORTSDIR}/devel/p5-Package-Stash-XS
RUN_DEPENDS=	\
	p5-Dist-CheckConflicts>=0.02:${PORTSDIR}/devel/p5-Dist-CheckConflicts \
	p5-Package-DeprecationManager>=0:${PORTSDIR}/devel/p5-Package-DeprecationManager \
	p5-Package-Stash-XS>=0.22:${PORTSDIR}/devel/p5-Package-Stash-XS

BUILD_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires

PERL_CONFIGURE=	yes

MAN3=		Package::Stash.3 \
		Package::Stash::PP.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
BUILD_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
