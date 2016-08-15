# New ports collection makefile for:	p5-HTML-Tree
# Date created:			3 January 2000
# Whom:				Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTML-Tree/Makefile,v 1.19 2006/08/07 06:41:04 clsung Exp $
#

PORTNAME=	HTML-Tree
PORTVERSION=	3.23
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of modules to manupulate HTML syntax trees
LICENSE=	perl

BUILD_DEPENDS=	p5-HTML-Parser>=2.19:${PORTSDIR}/www/p5-HTML-Parser \
		p5-HTML-Tagset>=3.02:${PORTSDIR}/www/p5-HTML-Tagset
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		HTML::Parse.3 HTML::TreeBuilder.3 HTML::AsSubs.3 \
		HTML::Element.3 HTML::Element::traverse.3 HTML::Tree.3 \
		HTML::Tree::Scanning.3 HTML::Tree::AboutObjects.3 \
		HTML::Tree::AboutTrees.3

.include <bsd.port.mk>
