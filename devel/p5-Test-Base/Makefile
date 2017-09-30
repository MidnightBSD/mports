# $MidnightBSD$

PORTNAME=	Test-Base
PORTVERSION=	0.60
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test::Base - A Data Driven Testing Framework
LICENSE=	perl

BUILD_DEPENDS=	p5-Spiffy>=0.30:${PORTSDIR}/devel/p5-Spiffy \
		p5-Test-Simple>=0.86:${PORTSDIR}/devel/p5-Test-Simple \
		p5-Test-Deep>0:${PORTSDIR}/devel/p5-Test-Deep
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
