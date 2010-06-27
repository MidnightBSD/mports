# $MidnightBSD: mports/devel/p5-DateTime-Format-W3CDTF/Makefile,v 1.1 2009/03/21 15:42:14 laffer1 Exp $

PORTNAME=	DateTime-Format-W3CDTF
PORTVERSION=	0.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and format W3CDTF datetime strings
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/DateTime.pm:${PORTSDIR}/devel/p5-DateTime
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		DateTime::Format::W3CDTF.3

.include <bsd.port.mk>
