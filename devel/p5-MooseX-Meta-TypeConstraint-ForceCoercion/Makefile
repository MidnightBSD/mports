PORTNAME=	MooseX-Meta-TypeConstraint-ForceCoercion
PORTVERSION=	0.01
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Force coercion when validating type constraints
WWW=		https://metacpan.org/release/MooseX-Meta-TypeConstraint-ForceCoercion

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Moose>=0:devel/p5-Moose \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
