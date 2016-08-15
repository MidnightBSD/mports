# $MidnightBSD$

PORTNAME=	Cpanel-JSON-XS
PORTVERSION=	3.0115
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RURBAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON::XS for Cpanel, fast and correct serialising

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-JSON>=0:${PORTSDIR}/converters/p5-JSON \
		p5-JSON-XS>=0:${PORTSDIR}/converters/p5-JSON-XS \
		p5-Test-LeakTrace>=0:${PORTSDIR}/devel/p5-Test-LeakTrace \
		p5-Test-Pod>=1:${PORTSDIR}/devel/p5-Test-Pod

PERL_CONFIGURE=	yes
USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
