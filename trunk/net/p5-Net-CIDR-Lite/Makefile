# $MidnightBSD: mports/net/p5-Net-CIDR-Lite/Makefile,v 1.2 2008/02/27 22:38:26 laffer1 Exp $

PORTNAME=	Net-CIDR-Lite
PORTVERSION=	0.20
CATEGORIES=	net perl5 ipv6
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for merging IPv4 or IPv6 CIDR addresses
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple

PERL_CONFIGURE=	yes

MAN3=		Net::CIDR::Lite.3

.include <bsd.port.mk>
