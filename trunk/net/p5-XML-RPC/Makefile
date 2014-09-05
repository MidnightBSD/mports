# $MidnightBSD$

PORTNAME=	XML-RPC
PORTVERSION=	0.9
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Perl implementation for an XML-RPC client and server
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/LWP/UserAgent.pm:${PORTSDIR}/www/p5-libwww \
		${SITE_PERL}/XML/TreePP.pm:${PORTSDIR}/textproc/p5-XML-TreePP
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
