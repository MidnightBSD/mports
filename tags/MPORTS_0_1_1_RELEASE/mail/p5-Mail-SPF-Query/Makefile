# New ports collection makefile for:    p5-Mail-SPF-Query
# Date created:                         Fri Jan 16 12:32:39 PST 2004
# Whom:                                 mharo@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Mail-SPF-Query/Makefile,v 1.5 2006/03/21 13:37:55 leeym Exp $
#

PORTNAME=	Mail-SPF-Query
PORTVERSION=	1.999.1
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Mail
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Query Sender Permitted From for an IP,email,helo

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/Net/CIDR/Lite.pm:${PORTSDIR}/net/p5-Net-CIDR-Lite \
		${SITE_PERL}/Sys/Hostname/Long.pm:${PORTSDIR}/sysutils/p5-Sys-Hostname-Long \
		${SITE_PERL}/URI/Escape.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=		spfd.1 spfquery.1
MAN3=		Mail::SPF::Query.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or above
.endif

.include <bsd.port.post.mk>
