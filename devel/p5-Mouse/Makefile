PORTNAME=	Mouse
PORTVERSION=	2.5.11
DISTVERSIONPREFIX=	v
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:SKAJI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Moose minus the antlers
WWW=		https://metacpan.org/release/Mouse

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Module-Build-XSUtil>=0.19:devel/p5-Module-Build-XSUtil
TEST_DEPENDS=	p5-Declare-Constraints-Simple>=0:devel/p5-Declare-Constraints-Simple \
		p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-IO-String>=0:devel/p5-IO-String \
		p5-Locale-US>=0:misc/p5-Locale-US \
		p5-Params-Coerce>=0:devel/p5-Params-Coerce \
		p5-Path-Class>=0:devel/p5-Path-Class \
		p5-Regexp-Common>=0:textproc/p5-Regexp-Common \
		p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-Exception>=0:devel/p5-Test-Exception \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-LeakTrace>=0:devel/p5-Test-LeakTrace \
		p5-Test-Output>=0:devel/p5-Test-Output \
		p5-Test-Requires>=0:devel/p5-Test-Requires \
		p5-URI>=0:net/p5-URI

USES=		perl5
USE_PERL5=	modbuild
NO_TEST=	yes

.include <bsd.port.mk>
