# $MidnightBSD: mports/net/p5-RPC-XML/Makefile,v 1.1 2010/02/05 01:13:03 laffer1 Exp $

PORTNAME=	RPC-XML
PORTVERSION=	0.73
CATEGORIES=	net www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML-RPC client and server library for Perl
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/LWP/UserAgent.pm:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
USE_GMAKE=	yes

MAN1=		make_method.1
MAN3=		Apache::RPC::Server.3 \
		Apache::RPC::Status.3 \
		RPC::XML.3 \
		RPC::XML::Client.3 \
		RPC::XML::Function.3 \
		RPC::XML::Method.3 \
		RPC::XML::Parser::XMLParser.3 \
		RPC::XML::Parser.3 \
		RPC::XML::ParserFactory.3 \
		RPC::XML::Procedure.3 \
		RPC::XML::Server.3

.include <bsd.port.mk>
