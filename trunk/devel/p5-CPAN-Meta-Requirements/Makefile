# $MidnightBSD$

PORTNAME=	CPAN-Meta-Requirements
PORTVERSION=	2.122
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of version requirements for a CPAN distribution
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		CPAN::Meta::Requirements.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
BUILD_DEPENDS+=	p5-version>=0.77:${PORTSDIR}/devel/p5-version
RUN_DEPENDS+=	p5-version>=0.77:${PORTSDIR}/devel/p5-version
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
