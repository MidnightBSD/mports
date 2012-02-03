# $FreeBSD: ports/converters/p5-JSON-XS/Makefile,v 1.15 2007/10/17 03:46:25 clsung Exp $
# $MidnightBSD: mports/converters/p5-JSON-XS/Makefile,v 1.6 2011/05/13 13:04:10 laffer1 Exp $

PORTNAME=	JSON-XS
PORTVERSION=	2.32
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON serialising/deserialising, done correctly and fast
LICENSE=	perl

RUN_DEPENDS=	p5-common-sense>0:${PORTSDIR}/devel/p5-common-sense
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
MAN1=		json_xs.1
MAN3=		JSON::XS.3 JSON::XS::Boolean.3

.include <bsd.port.mk>
