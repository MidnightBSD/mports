# $MidnightBSD$

PORTNAME=	Dist-CheckConflicts
PORTVERSION=	0.02
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DOY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Declare version conflicts for your dist
LICENSE=	perl

RUN_DEPENDS=	p5-List-MoreUtils>=0.12:${PORTSDIR}/lang/p5-List-MoreUtils \
		p5-Sub-Exporter>=0:${PORTSDIR}/devel/p5-Sub-Exporter

TEST_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

PERL_CONFIGURE=	YES

MAN3=		Dist::CheckConflicts.3

.include <bsd.port.post.mk>
