PORTNAME=	Package-DeprecationManager
PORTVERSION=	0.18
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage deprecation warnings for your distribution
WWW=		https://metacpan.org/release/Package-DeprecationManager

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Package-Stash>0:devel/p5-Package-Stash \
		p5-Params-Util>0:devel/p5-Params-Util \
		p5-Sub-Install>0:devel/p5-Sub-Install
TEST_DEPENDS=	p5-Test-Fatal>0:devel/p5-Test-Fatal \
		p5-Test-Warnings>0:devel/p5-Test-Warnings

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
