PORTNAME=	WWW-Mechanize-Cached
PORTVERSION=	2.00
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:OALDERS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cache responses to be polite to web servers
WWW=		https://metacpan.org/release/WWW-Mechanize-Cached

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cache-Cache>=0:devel/p5-Cache-Cache \
		p5-Data-Dump>=0:devel/p5-Data-Dump \
		p5-File-XDG>=1.03:devel/p5-File-XDG \
		p5-Moo>=1.004005:devel/p5-Moo \
		p5-MooX-Types-MooseLike>=0:devel/p5-MooX-Types-MooseLike \
		p5-Module-Runtime>=0:devel/p5-Module-Runtime \
		p5-Path-Tiny>=0.150:devel/p5-Path-Tiny \
		p5-WWW-Mechanize>=0:www/p5-WWW-Mechanize \
		p5-namespace-clean>=0:devel/p5-namespace-clean
TEST_DEPENDS=	p5-CHI>=0:devel/p5-CHI \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Needs>=0:devel/p5-Test-Needs \
		p5-Test-RequiresInternet>=0:devel/p5-Test-RequiresInternet \
		p5-Test-Warnings>=0:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

#Magus
NO_TEST=	yes

.include <bsd.port.mk>
