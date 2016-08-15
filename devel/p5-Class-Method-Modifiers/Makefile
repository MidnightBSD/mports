# Created by: Lars Balker Rasmussen <lbr@FreeBSD.org>
# $FreeBSD: head/devel/p5-Class-Method-Modifiers/Makefile 412346 2016-04-01 14:00:51Z mat $
# $MidnightBSD$

PORTNAME=	Class-Method-Modifiers
PORTVERSION=	2.12
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides Moose-like method modifiers

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Moose>=0:${PORTSDIR}/devel/p5-Moose \
		p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal \
		p5-Test-Requires>0:${PORTSDIR}/devel/p5-Test-Requires

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
