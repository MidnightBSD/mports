# $FreeBSD: ports/www/p5-HTML-Parser/Makefile,v 1.59 2006/07/13 13:10:59 mat Exp $
# $MidnightBSD$

PORTNAME=	HTML-Parser
PORTVERSION=	3.72
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for parsing HTML documents

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/HTML/Tagset.pm:${PORTSDIR}/www/p5-HTML-Tagset
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
