# $MidnightBSD: mports/devel/p5-namespace-clean/Makefile,v 1.1 2010/10/23 12:15:50 laffer1 Exp $

PORTNAME=	namespace-clean
PORTVERSION=	0.20
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keep imports and functions out of your namespace
LICENSE=	perl

BUILD_DEPENDS=	p5-B-Hooks-EndOfScope>=0.07:${PORTSDIR}/devel/p5-B-Hooks-EndOfScope \
		p5-Sub-Identify>=0.04:${PORTSDIR}/devel/p5-Sub-Identify \
		p5-Sub-Name>=0.04:${PORTSDIR}/devel/p5-Sub-Name
RUN_DEPENDS=	p5-B-Hooks-EndOfScope>=0.07:${PORTSDIR}/devel/p5-B-Hooks-EndOfScope \
		p5-Sub-Identify>=0.04:${PORTSDIR}/devel/p5-Sub-Identify \
		p5-Sub-Name>=0.04:${PORTSDIR}/devel/p5-Sub-Name \
		p5-Package-Stash>=0.03:${PORTSDIR}/devel/p5-Package-Stash

PERL_CONFIGURE=	5.8.0+

MAN3=	namespace::clean.3

post-extract:
	@${PERL} -i -ne 'print unless m,build_requires,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
