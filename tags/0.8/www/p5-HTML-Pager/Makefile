# New ports collection makefile for:	HTML-Pager
# Date created:				Mon Jan  1 11:59:43 2001
# Whom:					will
#
# $FreeBSD: ports/www/p5-HTML-Pager/Makefile,v 1.7 2003/10/24 14:15:29 erwin Exp $
# $MidnightBSD$
#

PORTNAME=	HTML-Pager
PORTVERSION=	0.03
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for handling CGI HTML paging of arbitrary data
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/HTML/Template.pm:${PORTSDIR}/www/p5-HTML-Template
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		HTML::Pager.3

.include <bsd.port.mk>
