PORTNAME=	List-AllUtils
PORTVERSION=	0.19
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Combines List::Util and List::MoreUtils in one bite-sized package
WWW=		https://metacpan.org/release/List-AllUtils

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-List-SomeUtils>=0.58:devel/p5-List-SomeUtils \
		p5-List-UtilsBy>=0.11:devel/p5-List-UtilsBy \
		p5-Scalar-List-Utils>=1.56,1:lang/p5-Scalar-List-Utils

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
