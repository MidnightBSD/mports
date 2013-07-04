# $MidnightBSD: mports/mail/p5-Mail-SPF-Query/Makefile,v 1.2 2008/07/19 17:49:31 laffer1 Exp $

PORTNAME=	Mail-SPF-Query
PORTVERSION=	1.999.1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Query Sender Permitted From for an IP,email,helo
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/Net/CIDR/Lite.pm:${PORTSDIR}/net/p5-Net-CIDR-Lite \
		${SITE_PERL}/Sys/Hostname/Long.pm:${PORTSDIR}/sysutils/p5-Sys-Hostname-Long \
		${SITE_PERL}/URI/Escape.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS=	p5-Mail-SPF-[0-9]*

PERL_CONFIGURE=	yes

MAN1=		spfd.1 spfquery.1
MAN3=		Mail::SPF::Query.3

.include <bsd.port.mk>
