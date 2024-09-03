PORTNAME=	Type-Tiny
PORTVERSION=	2.004000
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TOBYINK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny, yet Moo(se)-compatible type constraint
WWW=		https://metacpan.org/release/Type-Tiny

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Exporter-Tiny>=1.006000:devel/p5-Exporter-Tiny

USES=		perl5
USE_PERL5=	configure

# circular depends on moose
NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

OPTIONS_DEFINE=	RECOMMENDED
OPTIONS_DEFAULT=RECOMMENDED
RECOMMENDED_DESC=	Recommended dependencies by upstream

RECOMMENDED_BUILD_DEPENDS=	${RECOMMENDED_RUN_DEPENDS}
RECOMMENDED_RUN_DEPENDS=	p5-Class-XSAccessor>=1.17,1:devel/p5-Class-XSAccessor \
				p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace \
				p5-Ref-Util-XS>=0.100:devel/p5-Ref-Util-XS \
				p5-Type-Tiny-XS>=0.025:devel/p5-Type-Tiny-XS

.include <bsd.port.mk>
