PORTNAME=	List-SomeUtils-XS
PORTVERSION=	0.58
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XS implementation for List::SomeUtils

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Test-LeakTrace>=0:devel/p5-Test-LeakTrace \
		p5-Test-Warnings>=0.006:devel/p5-Test-Warnings

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/List/SomeUtils/XS/XS.so

.include <bsd.port.mk>
