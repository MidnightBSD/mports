PORTNAME=	Package-Stash-XS
PORTVERSION=	0.30
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Faster and more correct implementation of the Package::Stash API
WWW=		https://metacpan.org/release/Package-Stash-XS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Needs>=0:devel/p5-Test-Needs

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Package/Stash/XS/XS.so

.include <bsd.port.mk>
