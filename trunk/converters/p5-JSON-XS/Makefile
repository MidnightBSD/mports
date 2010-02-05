# New ports collection makefile for:	JSON-XS
# Date created:		25 Mar 2007
# Whom:			Cheng-Lung Sung <clsung@FreeBSD.org>
#
# $FreeBSD: ports/converters/p5-JSON-XS/Makefile,v 1.15 2007/10/17 03:46:25 clsung Exp $
# $MidnightBSD: mports/converters/p5-JSON-XS/Makefile,v 1.4 2010/02/05 01:22:41 laffer1 Exp $
#

PORTNAME=	JSON-XS
PORTVERSION=	2.26
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
#DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON serialising/deserialising, done correctly and fast
LICENSE=	perl

RUN_DEPENDS=	p5-common-sense>0:${PORTSDIR}/devel/p5-common-sense
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	5.8.0+
MAN1=		json_xs.1
MAN3=		JSON::XS.3 JSON::XS::Boolean.3

.include <bsd.port.mk>
