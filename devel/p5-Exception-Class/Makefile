PORTNAME=	Exception-Class
PORTVERSION=	1.45
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Real exception classes in Perl
WWW=		https://metacpan.org/release/Exception-Class

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Data-Inheritable>=0.02:devel/p5-Class-Data-Inheritable \
		p5-Devel-StackTrace>=2.00:devel/p5-Devel-StackTrace

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
