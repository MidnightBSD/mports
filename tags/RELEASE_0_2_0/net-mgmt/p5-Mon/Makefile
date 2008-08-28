# New ports collection makefile for:	p5-Mon
# Date created:			October 30th, 2000
# Whom:	      			Nicholas Esborn <nick@netdot.net>
#
# $FreeBSD: ports/net-mgmt/p5-Mon/Makefile,v 1.6 2004/02/23 04:42:07 wollman Exp $
# $MidnightBSD: mports/net-mgmt/p5-Mon/Makefile,v 1.1 2006/12/26 00:59:17 laffer1 Exp $
#

PORTNAME=	Mon
PORTVERSION=	0.11
CATEGORIES=	net-mgmt sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Mon
PKGNAMEPREFIX=	p5-
DISTNAME=	Mon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl module that supports mon, a network and system monitoring daemon
LICENSE=	gpl2

PERL_CONFIGURE=	YES

MAN3=		Mon::SNMP.3 \
		Mon::Client.3 \
		Mon::Protocol.3

.include <bsd.port.mk>
