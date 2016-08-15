# $MidnightBSD$

PORTNAME=	Bit-Vector
PORTVERSION=	7.3
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of advanced math functions that includes a Perl OO module
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Carp/Clan.pm:${PORTSDIR}/devel/p5-Carp-Clan
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Bit::Vector.3 Bit::Vector::Overload.3 Bit::Vector::String.3

.include <bsd.port.mk>
