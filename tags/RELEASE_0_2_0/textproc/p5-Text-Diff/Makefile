# New ports collection makefile for:	textproc/p5-Text-Diff
# Date created:				14 July 2002
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-Text-Diff/Makefile,v 1.4 2003/10/24 12:04:07 ijliao Exp $
#

PORTNAME=	Text-Diff
PORTVERSION=	0.35
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text::Diff - Perform diffs on files and record sets

BUILD_DEPENDS=	${SITE_PERL}/Algorithm/Diff.pm:${PORTSDIR}/devel/p5-Algorithm-Diff
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Text::Diff.3 Text::Diff::Table.3

.include <bsd.port.mk>
