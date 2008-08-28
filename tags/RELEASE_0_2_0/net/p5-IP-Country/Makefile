# New ports collection makefile for:	net/p5-IP-Countries
# Date created:				20 June 2005
# Whom:					dikshie <dikshie@lapi.itb.ac.id>
#
# $MidightBSD$
# $FreeBSD: ports/net/p5-IP-Country/Makefile,v 1.4 2007/02/07 04:57:46 leeym Exp $
#

PORTNAME=	IP-Country
PORTVERSION=	2.23
CATEGORIES=	net perl5 geography
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../by-authors/id/N/NW/NWETTERS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast lookup of country codes from IP addresses

PERL_CONFIGURE=	yes

MAN1=		ip2cc.1
MAN3=		IP::Authority.3 \
		IP::Country::Fast.3 \
		IP::Country::MaxMind.3 \
		IP::Country::Medium.3 \
		IP::Country::Slow.3 \
		IP::Country.3

.include <bsd.port.mk>
