PORTNAME=	MooseX-ConfigFromFile
PORTVERSION=	0.14
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to abstract Moose role attribute setting from file

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	\
	p5-Moose>0:devel/p5-Moose \
	p5-MooseX-Types>=0.19:devel/p5-MooseX-Types \
	p5-MooseX-Types-Path-Tiny>=0.005:devel/p5-MooseX-Types-Path-Tiny \
	p5-namespace-autoclean>0:devel/p5-namespace-autoclean

USES=	perl5
USE_PERL5=	modbuildtiny
NO_ARCH=	YES
NO_TEST=	yes

.include <bsd.port.mk>
