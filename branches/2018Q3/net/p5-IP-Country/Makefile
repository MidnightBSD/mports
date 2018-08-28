# $MidnightBSD$

PORTNAME=	IP-Country
PORTVERSION=	2.28
CATEGORIES=	net perl5 geography
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast lookup of country codes from IP addresses

LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Geography/Countries.pm:${PORTSDIR}/misc/p5-Geography-Countries
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
