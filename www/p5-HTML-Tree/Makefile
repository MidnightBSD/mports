# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTML-Tree/Makefile,v 1.19 2006/08/07 06:41:04 clsung Exp $

PORTNAME=	HTML-Tree
PORTVERSION=	3.23
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of modules to manupulate HTML syntax trees

LICENSE=	perl

BUILD_DEPENDS=	p5-HTML-Parser>=2.19:${PORTSDIR}/www/p5-HTML-Parser \
		p5-HTML-Tagset>=3.02:${PORTSDIR}/www/p5-HTML-Tagset
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
