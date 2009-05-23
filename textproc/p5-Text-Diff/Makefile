# $MidnightBSD: mports/textproc/p5-Text-Diff/Makefile,v 1.1 2007/03/11 05:39:39 laffer1 Exp $

PORTNAME=	Text-Diff
PORTVERSION=	0.35
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text::Diff - Perform diffs on files and record sets
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Algorithm/Diff.pm:${PORTSDIR}/devel/p5-Algorithm-Diff
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Text::Diff.3 Text::Diff::Table.3

.include <bsd.port.mk>
