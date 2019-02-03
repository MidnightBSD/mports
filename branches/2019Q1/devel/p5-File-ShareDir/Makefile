# $MidnightBSD$

PORTNAME=	File-ShareDir
PORTVERSION=	1.02
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locate per-dist and per-module shared files
LICENSE=	perl

RUN_DEPENDS=	p5-Class-Inspector>=1.12:${PORTSDIR}/devel/p5-Class-Inspector \
		p5-Params-Util>=0.07:${PORTSDIR}/devel/p5-Params-Util
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
