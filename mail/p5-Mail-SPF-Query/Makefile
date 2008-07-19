# New ports collection makefile for:    p5-Mail-SPF-Query
# Date created:                         Fri Jan 16 12:32:39 PST 2004
# Whom:                                 mharo@FreeBSD.org
#
# $MidnightBSD: mports/mail/p5-Mail-SPF-Query/Makefile,v 1.1 2007/03/21 01:29:11 laffer1 Exp $
# $FreeBSD: ports/mail/p5-Mail-SPF-Query/Makefile,v 1.5 2006/03/21 13:37:55 leeym Exp $
#

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

PERL_CONFIGURE=	yes

MAN1=		spfd.1 spfquery.1
MAN3=		Mail::SPF::Query.3

.include <bsd.port.mk>
