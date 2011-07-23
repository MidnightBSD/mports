# $MidnightBSD: mports/devel/p5-JSON-RPC/Makefile,v 1.1 2011/07/17 19:46:01 laffer1 Exp $
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

MAN3=		JSON::RPC.3 JSON::RPC::Server.3 JSON::RPC::Client.3 \
		JSON::RPC::Procedure.3 JSON::RPC::Server::CGI.3 JSONRPC.3 \
		JSON::RPC::Server::Daemon.3 JSON::RPC::Server::Apache2.3

.include <bsd.port.mk>
