# $FreeBSD: ports/converters/p5-JSON-Any/Makefile,v 1.18 2011/04/01 05:48:29 bapt Exp $
# $MidnightBSD$

PORTNAME=	JSON-Any
PORTVERSION=	1.28
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl Wrapper Class for the various JSON classes
LICENSE=	perl

RUN_DEPENDS=	p5-JSON>=2.02:${PORTSDIR}/converters/p5-JSON
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
MAN3=		JSON::Any.3

.include <bsd.port.mk>
