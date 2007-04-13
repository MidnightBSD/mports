# New ports collection makefile for:	p5-HTML-Table
# Date created:			Di  13 Mär 2001 19:37:25 CET
# Whom:				Andreas Klemm <andreas@klemm.gtn.com>
#
# $FreeBSD: ports/www/p5-HTML-Table/Makefile,v 1.16 2006/06/25 16:38:46 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	HTML-Table
PORTVERSION=	2.04a
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	HTML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate HTML tables for CGI scripts

PERL_CONFIGURE=	yes

MAN3=		HTML::Table.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or later. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
