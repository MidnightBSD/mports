# New ports collection makefile for:	textproc/p5-Text-Autoformat
# Date created:				28 December 2000
# Whom:					Anton Berezin <tobez@tobez.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-Text-Autoformat/Makefile,v 1.6 2005/05/24 12:00:28 tobez Exp $
#

PORTNAME=	Text-Autoformat
PORTVERSION=	1.13
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic and manual text wrapping and reformating formatting

BUILD_DEPENDS=	${SITE_PERL}/Text/Reform.pm:${PORTSDIR}/textproc/p5-Text-Reform
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Text::Autoformat.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires at least perl 5.6.0, use lang/perl5.8 or lang/perl5
.endif

.include <bsd.port.post.mk>
