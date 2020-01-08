PORTNAME=	MooseX-Getopt
PORTVERSION=	0.74
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN/MooseX CPAN
MASTER_SITE_SUBDIR=	CPAN:ETHER
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Moose role for processing command line options

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Getopt-Long-Descriptive>=0.081:devel/p5-Getopt-Long-Descriptive \
		p5-Moose>=0.56:devel/p5-Moose \
		p5-MooseX-ConfigFromFile>=0:devel/p5-MooseX-ConfigFromFile \
		p5-MooseX-Role-Parameterized>=1.01:devel/p5-MooseX-Role-Parameterized \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuildtiny

.include <bsd.port.mk>
