PORTNAME=	MooseX-Types
PORTVERSION=	0.50
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Organise your Moose types in libraries

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Carp-Clan>=6.00:devel/p5-Carp-Clan \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Moose>=1.06:devel/p5-Moose \
		p5-Sub-Exporter>=0:devel/p5-Sub-Exporter \
		p5-Sub-Exporter-ForMethods>=0.100052:devel/p5-Sub-Exporter-ForMethods \
		p5-Sub-Install>=0:devel/p5-Sub-Install \
		p5-Sub-Name>=0:devel/p5-Sub-Name \
		p5-namespace-autoclean>=0.08:devel/p5-namespace-autoclean \
		p5-namespace-clean>=0:devel/p5-namespace-clean

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuildtiny

.include <bsd.port.mk>
