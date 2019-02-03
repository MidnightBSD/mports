# $FreeBSD: ports/www/p5-HTML-Pager/Makefile,v 1.7 2003/10/24 14:15:29 erwin Exp $
# $MidnightBSD$

PORTNAME=	HTML-Pager
PORTVERSION=	0.03
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for handling CGI HTML paging of arbitrary data

LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/HTML/Template.pm:${PORTSDIR}/www/p5-HTML-Template
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
