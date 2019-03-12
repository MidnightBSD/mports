# $MidnightBSD$

PORTNAME=	Test-Fatal
PORTVERSION=	0.010
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Incredibly simple helpers for testing code with exceptions
LICENSE=	perl

BUILD_DEPENDS=	p5-Try-Tiny>=0.07:${PORTSDIR}/lang/p5-Try-Tiny
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
