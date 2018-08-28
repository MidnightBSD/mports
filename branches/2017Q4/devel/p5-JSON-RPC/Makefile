# $MidnightBSD$
# $FreeBSD: ports/devel/p5-JSON-RPC/Makefile,v 1.3 2010/01/28 23:45:30 kuriyama Exp $

PORTNAME=	JSON-RPC
PORTVERSION=	0.96
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl implementation of JSON-RPC 1.1 protocol
LICENSE=	perl

RUN_DEPENDS=	p5-JSON>=2.0:${PORTSDIR}/converters/p5-JSON \
		p5-libwww>=0:${PORTSDIR}/www/p5-libwww

PERL_CONFIGURE=	YES

.include <bsd.port.mk>
