# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Date-Calc/Makefile,v 1.11 2007/01/27 19:20:17 mat Exp $

PORTNAME=	Date-Calc
PORTVERSION=	6.3
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gregorian calendar date calculations

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Bit-Vector>=7.1:${PORTSDIR}/math/p5-Bit-Vector \
		p5-Carp-Clan>=5.3:${PORTSDIR}/devel/p5-Carp-Clan
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
PERL_CONFIGURE=       yes

.include <bsd.port.mk>
