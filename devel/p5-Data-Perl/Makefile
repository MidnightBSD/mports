PORTNAME=	Data-Perl
PORTVERSION=	0.002009
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base classes wrapping fundamental Perl data types

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Method-Modifiers>=0:devel/p5-Class-Method-Modifiers \
		p5-List-MoreUtils>=0:lang/p5-List-MoreUtils \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Role-Tiny>=0:devel/p5-Role-Tiny \
		p5-strictures>=1:devel/p5-strictures

USES=		perl5
USE_PERL5=	configure

#magus issues
NO_TEST=	yes

.include <bsd.port.mk>
