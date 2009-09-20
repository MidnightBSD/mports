# $MidnightBSD: mports/converters/p5-JSON/Makefile,v 1.3 2008/03/14 00:36:43 laffer1 Exp $

PORTNAME=	JSON
PORTVERSION=	1.15
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../authors/id/M/MA/MAKAMAKA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Perl extension to convert to JSON (JavaScript Object Notation)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/HTTP/Request.pm:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
MAN3=		Apache::JSONRPC.3 JSON.3 JSON::Converter.3 \
		JSON::PP.3 JSON::Parser.3 \
		JSONRPC.3 JSONRPC::Transport::HTTP.3

.include <bsd.port.mk>

