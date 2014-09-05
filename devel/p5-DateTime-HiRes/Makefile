# $MidnightBSD$

PORTNAME=	DateTime-HiRes
PORTVERSION=	0.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create DateTime objects with sub-second current time resolution
LICENSE=	perl

BUILD_DEPENDS:=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:${PORTSDIR}/devel/p5-DateTime \
		p5-Time-HiRes>=0:${PORTSDIR}/devel/p5-Time-HiRes

PERL_MODBUILD=	yes

.include <bsd.port.mk>
