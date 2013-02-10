# $MidnightBSD: mports/net/p5-Net-Server/Makefile,v 1.4 2009/06/27 22:26:50 laffer1 Exp $

PORTNAME=	Net-Server
PORTVERSION=	0.99
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A base class for writing internet servers in Perl
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Net::Server.3 \
		Net::Server::Daemonize.3\
		Net::Server::Fork.3 \
		Net::Server::HTTP.3 \
		Net::Server::INET.3 \
		Net::Server::MultiType.3 \
		Net::Server::Multiplex.3 \
		Net::Server::PreFork.3 \
		Net::Server::PreForkSimple.3\
		Net::Server::Proto.3\
		Net::Server::Proto::SSL.3\
		Net::Server::Proto::SSLEAY.3\
		Net::Server::Proto::TCP.3\
		Net::Server::Proto::UDP.3\
		Net::Server::Proto::UNIX.3\
		Net::Server::SIG.3\
		Net::Server::Single.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/IO/Socket/UNIX.pm:${PORTSDIR}/devel/p5-IO
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/IO/Socket/UNIX.pm:${PORTSDIR}/devel/p5-IO
.endif

post-patch:
	${FIND} ${WRKSRC} -name '*.orig' -delete

.include <bsd.port.post.mk>
