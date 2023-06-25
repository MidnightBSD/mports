PORTNAME=	CGI-Emulate-PSGI
PORTVERSION=	0.22
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MIYAGAWA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension of PSGI adapter for CGI
WWW=		https://metacpan.org/release/CGI-Emulate-PSGI

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-CGI>=3.63:www/p5-CGI \
		p5-HTTP-Message>=0:www/p5-HTTP-Message

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	YES

# dependency issues
NO_TEST=	yes

.include <bsd.port.mk>
