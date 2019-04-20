PORTNAME=	Convert-Color
PORTVERSION=	0.11
PORTREVISION=	2
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for color space conversions and named lookups

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	\
	p5-List-UtilsBy>0:devel/p5-List-UtilsBy \
	p5-Module-Pluggable>=0:devel/p5-Module-Pluggable

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	YES
NO_TEST=	yes

.include <bsd.port.mk>
