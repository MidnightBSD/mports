# New ports collection makefile for:	devel/p5-Carp-Clan
# Date created:				02 November 2004
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Carp-Clan/Makefile,v 1.1 2007/03/11 04:00:06 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Carp-Clan/Makefile,v 1.4 2006/10/09 18:20:49 clsung Exp $
#

PORTNAME=	Carp-Clan
PORTVERSION=	6.00
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Report errors from perspective of caller of a "clan" of modules
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/Exception.pm:${PORTSDIR}/devel/p5-Test-Exception

PERL_CONFIGURE=	yes

MAN3=	Carp::Clan.3

.include <bsd.port.mk>
