# $MidnightBSD$

PORTNAME=	Test-Differences
PORTVERSION=	0.500
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test::Differences - Test strings and data structures for differences
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Text/Diff.pm:${PORTSDIR}/textproc/p5-Text-Diff
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Test::Differences.3

.include <bsd.port.mk>
