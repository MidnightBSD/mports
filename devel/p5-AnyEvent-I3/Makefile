PORTNAME=	AnyEvent-I3
PORTVERSION=	0.19
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Communicate with the i3 window manager
WWW=		https://metacpan.org/release/AnyEvent-I3

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-AnyEvent>=0:devel/p5-AnyEvent \
		p5-JSON-XS>=0:converters/p5-JSON-XS
RUN_DEPENDS=	p5-AnyEvent>=0:devel/p5-AnyEvent \
		p5-JSON-XS>=0:converters/p5-JSON-XS

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
