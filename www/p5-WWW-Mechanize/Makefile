PORTNAME=	WWW-Mechanize
PORTVERSION=	2.19
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handy web browsing in a Perl object
WWW=		https://metacpan.org/release/WWW-Mechanize

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Form>=6.08:www/p5-HTML-Form \
		p5-HTML-Parser>=0:www/p5-HTML-Parser \
		p5-HTML-Tree>=5:www/p5-HTML-Tree \
		p5-HTTP-Cookies>=0:www/p5-HTTP-Cookies \
		p5-HTTP-Message>=1.30:www/p5-HTTP-Message \
		p5-libwww>=0:www/p5-libwww \
		p5-URI>=0:net/p5-URI
TEST_DEPENDS=	p5-HTTP-Daemon>=6.12:www/p5-HTTP-Daemon \
		p5-Path-Tiny>=0:devel/p5-Path-Tiny \
		p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-Test-Memory-Cycle>=0:devel/p5-Test-Memory-Cycle \
		p5-Test-Output>=0:devel/p5-Test-Output \
		p5-Test-Taint>=1.08:devel/p5-Test-Taint \
		p5-Test-Warnings>=0:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

#Magus
NO_TEST=	yes

.include <bsd.port.mk>
