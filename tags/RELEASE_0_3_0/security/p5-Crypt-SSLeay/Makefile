# $MidnightBSD: mports/security/p5-Crypt-SSLeay/Makefile,v 1.2 2008/10/11 22:17:13 laffer1 Exp $

PORTNAME=	Crypt-SSLeay
PORTVERSION=	0.57
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to allow p5-libwww LWP to make https connections
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/URI/URL.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	--lib=${OPENSSLBASE}
USE_OPENSSL=	yes

MAN3=		Crypt::SSLeay.3 Net::SSL.3

.include <bsd.port.mk>
