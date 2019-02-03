# $MidnightBSD$

PORTNAME=	Chart
PORTVERSION=	2.4.10
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CHARTGRP
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to build chart graphics

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-GD>=2:graphics/p5-GD
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
