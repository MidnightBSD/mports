# $MidnightBSD$

PORTNAME=	Test-NoWarnings
PORTVERSION=	1.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hide and store warnings while running test scripts
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Test::NoWarnings.3

OPTIONS=	DEVEL_STACKTRACE "Stack trace support" off

.include <bsd.port.pre.mk>

.if defined(WITH_DEVEL_STACKTRACE)
BUILD_DEPENDS+=	p5-Devel-StackTrace>=0:${PORTSDIR}/devel/p5-Devel-StackTrace
RUN_DEPENDS+=	p5-Devel-StackTrace>=0:${PORTSDIR}/devel/p5-Devel-StackTrace
.endif

.include <bsd.port.post.mk>
