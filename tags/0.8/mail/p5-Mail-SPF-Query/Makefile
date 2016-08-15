# $MidnightBSD$

PORTNAME=	Mail-SPF-Query
PORTVERSION=	1.999.1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Query Sender Permitted From for an IP,email,helo

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Net-DNS>=0.63:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/Net/CIDR/Lite.pm:${PORTSDIR}/net/p5-Net-CIDR-Lite \
		${SITE_PERL}/Sys/Hostname/Long.pm:${PORTSDIR}/sysutils/p5-Sys-Hostname-Long \
		${SITE_PERL}/URI/Escape.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS=	p5-Mail-SPF-[0-9]*

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
