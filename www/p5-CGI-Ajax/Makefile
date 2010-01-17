# $MidnightBSD: mports/www/p5-CGI-Ajax/Makefile,v 1.3 2009/06/27 22:03:23 laffer1 Exp $
#

PORTNAME=	CGI-Ajax
PORTVERSION=	0.707
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A module for writing AJAX/DHTML-based web apps
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	CGI::Ajax.3

.include <bsd.port.mk>
