# Created by: Felippe de Meirelles Motta <lippemail@gmail.com>

PORTNAME=	Test-YAML-Meta
PORTVERSION=	0.22
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Validation of the META.yml file in a distribution

LICENSE=	artistic

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Test-YAML-Valid>=0:devel/p5-Test-YAML-Valid \
		p5-Test-CPAN-Meta-YAML>=0.17:devel/p5-Test-CPAN-Meta-YAML

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
