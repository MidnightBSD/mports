PORTNAME=	MooseX-Types-Path-Class
PORTVERSION=	0.09
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Path::Class type library for Moose

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Moose>=2:devel/p5-Moose \
		p5-MooseX-Getopt>=0:devel/p5-MooseX-Getopt \
		p5-MooseX-Types>=0.04:devel/p5-MooseX-Types \
		p5-Path-Class>=0.16:devel/p5-Path-Class

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuildtiny

.include <bsd.port.mk>
