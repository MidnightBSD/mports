# $MidnightBSD$

PORTNAME=	JSON-XS
PORTVERSION=	2.34
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
