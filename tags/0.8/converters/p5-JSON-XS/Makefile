# $MidnightBSD$

PORTNAME=	JSON-XS
PORTVERSION=	3.01
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON serialising/deserialising, done correctly and fast

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Types-Serialiser>=0:${PORTSDIR}/devel/p5-Types-Serialiser \
		p5-common-sense>0:${PORTSDIR}/devel/p5-common-sense
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
