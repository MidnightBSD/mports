# New ports collection makefile for:	p5-HTML-Parser
# Date Created:				28 April 1998
# Whom:					Vanilla I. Shu <vanilla@FreeBSD.org>
#
# $FreeBSD: ports/www/p5-HTML-Parser/Makefile,v 1.59 2006/07/13 13:10:59 mat Exp $
# $MidnightBSD: mports/www/p5-HTML-Parser/Makefile,v 1.4 2010/01/17 15:07:47 laffer1 Exp $
#

PORTNAME=	HTML-Parser
PORTVERSION=	3.65
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for parsing HTML documents
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/HTML/Tagset.pm:${PORTSDIR}/www/p5-HTML-Tagset \
		${SITE_PERL}/URI.pm:${PORTSDIR}/net/p5-URI
BUILD_DEPENDS=	${RUN_DEPENDS}
BUILD_DEPENDS+=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple

PERL_CONFIGURE=	yes

MAN3=		HTML::Entities.3 \
		HTML::Filter.3 \
		HTML::HeadParser.3 \
		HTML::LinkExtor.3 \
		HTML::Parser.3 \
		HTML::PullParser.3 \
		HTML::TokeParser.3

.include <bsd.port.mk>
