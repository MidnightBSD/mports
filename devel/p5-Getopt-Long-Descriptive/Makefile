PORTNAME=	Getopt-Long-Descriptive
PORTVERSION=	0.114
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RJBS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Getopt::Long with usage text
WWW=		https://metacpan.org/release/Getopt-Long-Descriptive

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Getopt-Long>=2.55:devel/p5-Getopt-Long \
		p5-Params-Validate>=0.97:devel/p5-Params-Validate \
		p5-Sub-Exporter>=0.972:devel/p5-Sub-Exporter
TEST_DEPENDS=	p5-CPAN-Meta-Check>=0.011:devel/p5-CPAN-Meta-Check \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Warnings>=0.005:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
