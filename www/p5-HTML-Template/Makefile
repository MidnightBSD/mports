PORTNAME=	HTML-Template
PORTVERSION=	2.97
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to use HTML Templates from CGI scripts
WWW=		https://metacpan.org/release/HTML-Template

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-CGI>=0:www/p5-CGI
TEST_DEPENDS=	p5-Test-Pod>=0:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
